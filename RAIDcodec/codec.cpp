#include <cstdlib>
#include <fstream>
#include <iostream>
#include <random>
#include <string>
#include <unordered_set>
#include <vector>

// Constants that are determined by the user when passing in arguments to
// encode. I suppose we'd want these values to be included in the JSON file
// later.

// static int width = 1;
// static int height = 1;

// Number of indexing bytes per oligo / row
static int ibytes = 3;

// Helper function for the encode function that takes in an array of unsigned
// characters and segments it into rows while adding indexing to each row.
std::vector<std::vector<unsigned char>>
outer_encode(std::vector<unsigned char> &input, int width, int height) {
  // Height + 1 to account for indexing of the parity check row
  std::vector<std::vector<unsigned char>> output(height + 1);
  for (int i = 0; i < height + 1; i++) {
    std::vector<unsigned char> row;
    for (int j = 0; j < ibytes; j++) {
      // i is the index being represented as 3 bytes
      row.push_back((i >> (8 * (ibytes - 1 - j))) & 255);
    }
    for (int j = 0; j < width; j++) {
      if (i != height) {
        row.push_back(input[i * width + j]);
      } else {
        row.push_back(0);
      }
    }
    output[i] = row;
  }
  return output;
}

// Helper function for the encode function that encodes a given 2D array into a
// RAID-based array
std::vector<std::vector<unsigned char>>
inner_encode(std::vector<std::vector<unsigned char>> &input) {
  // Extracting height and width based on the input array
  int height = input.size();
  int width = input[0].size();
  // Will store encoded RAID array
  std::vector<std::vector<unsigned char>> output(
      height + 1, std::vector<unsigned char>(width + 1));
  for (int i = 0; i < height + 1; i++) {
    for (int j = 0; j < width; j++) {
      unsigned char cur = input[i][j];
      // No parity check for indices
      if (i != height && j >= ibytes) {
        // Xoring the corresponding column byte
        output[height][j] ^= cur;
        // Xoring the row byte
        output[i][width] ^= cur;
      }
      // All bytes except for ones that will override parity check bytes should
      // be copied over
      if (i != height || j < ibytes) {
        // Copying over byte
        output[i][j] = cur;
      }
    }
  }
  return output;
}

// Encodes a byte vector with a xor byte for each "column",
// a xor byte for each "row", and ibytes index bytes into a FASTA file called
// "encoded.fasta."
/**
  + -> payload byte
  e -> parity byte
  i -> index byte
  f -> filler byte (has no purpose)
  +++    iii+++e
  +++    iii+++e
  +++ -> iii+++e
         iiieeef
  **/
// Preconditions:
// w and h are positive integers
// The size of the input array is equal to w * h
void encode(std::vector<unsigned char> &input, int width, int height) {
  if (input.size() != width * height) {
    std::cout << "The size of the input array does not equal w * h";
    return;
  }
  // Applying outer and inner codecs
  std::vector<std::vector<unsigned char>> res =
      outer_encode(input, width, height);
  res = inner_encode(res);
  // Outputting to fasta file. ios::trunc clears the file before writing to it
  std::ofstream output("encoded.fasta", std::ios::out | std::ios::trunc);
  for (int i = 0; i < res.size(); i++) {
    output << '>' << i + 1 << std::endl;
    for (int j = 0; j < res[0].size(); j++) {
      for (int k = 6; k >= 0; k -= 2) {
        // Mask is 3 because 3 = 11b
        int num = 3 & (res[i][j] >> k);
        if (num == 0) {
          output << 'A';
        } else if (num == 1) {
          output << 'G';
        } else if (num == 2) {
          output << 'T';
        } else {
          output << 'C';
        }
      }
    }
    output << std::endl;
  }
  output.close();
}

// Decode a FASTA file potentially containing IDS and erasure errors using RAID
// concepts.
// Preconditions:
// No rows in the given FASTA file are out of order
// w and h are positive integers
// The size of the input array is equal to w * h
// The same w and h were used for the encoding of this FASTA file
std::vector<unsigned char> decode(std::ifstream &file, int width, int height) {
  // Array that will contain the reconstructed RAID array
  std::vector<std::vector<unsigned char>> arr(
      height + 1, std::vector<unsigned char>(width));
  // Array that will store indices of rows with errors (erasure, IDS)
  std::vector<int> errors;
  // Set that tracks what rows have been sampled
  std::unordered_set<int> received;
  std::string line;
  while (getline(file, line)) {
    // Might not need the first check, as there never should be empty lines
    // Width + index bytes + 1 columns, and 4 nucelotides per byte
    // If the length of the line is not correct, we know there is some error
    if (!line.empty() && line[0] != '>' &&
        line.length() == (width + ibytes + 1) * 4) {
      // No errors so we extract the row
      std::vector<unsigned char> row;
      for (int i = 0; i < line.length(); i += 4) {
        unsigned char byte = 0;
        for (int j = 0; j < 4; j++) {
          // The two bits we are trying to extract
          int nibble = 0;
          if (line[i + j] == 'A') {
            nibble = 0;
          } else if (line[i + j] == 'G') {
            nibble = 1;
          } else if (line[i + j] == 'T') {
            nibble = 2;
          } else {
            nibble = 3;
          }
          // We are trying to reconstruct the byte left to right
          byte |= (nibble << (2 * (3 - j)));
        }
        row.push_back(byte);
      }
      // Extracting index
      int index = 0;
      for (int i = 0; i < ibytes; i++) {
        index |= (row[i] << ((ibytes - 1 - i) * 8));
      }
      received.insert(index);
      arr[index] = std::vector<unsigned char>(row.begin() + ibytes, row.end());
    }
  }
  file.close();
  // Seeing which indices were not received
  for (int i = 0; i < height + 1; i++) {
    if (!received.count(i)) {
      errors.push_back(i);
    }
  }
  // Iterate through the reconstructed RAID array while calculating parity for
  // each row. We do not need to iterate through the appended parity byte row
  for (int i = 0; i < height; i++) {
    unsigned char pbyte = 0;
    for (int j = 0; j < width + 1; j++) {
      pbyte ^= arr[i][j]; // calculating parity
    }
    if (pbyte != 0) {
      errors.push_back(i);
    }
  }
  if (errors.size() > 1) {
    // If there is more than one row with errors we cannot recover the data
    return {};
  } else if (errors.empty()) {
    // If there are no errors from checking the row parity bytes, we will check
    // the column bytes
    for (int j = 0; j < width; j++) {
      unsigned char pbyte = 0;
      for (int i = 0; i < height + 1; i++) {
        pbyte ^= arr[i][j];
      }
      // The column has an error, which we cannot correct
      if (pbyte != 0) {
        return {};
      }
    }
    // We can only correct errors if there's exactly 1 row with incorrect parity
  } else {
    // Index of row with error
    int wrong = errors.front();
    for (int i = 0; i < width; i++) {
      // The parity byte of the current corresponding column
      unsigned char pbyte = 0;
      for (int j = 0; j < height; j++) {
        if (j != wrong) {
          pbyte ^= arr[i][j];
        }
      }
      // Setting the corrected byte
      arr[wrong][i] = pbyte;
    }
  }
  // Array to store decoded data
  std::vector<unsigned char> decoded(height * width);
  // Parse the RAID array to get the original data
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      decoded[width * i + j] = arr[i][j];
    }
  }
  return decoded;
}
