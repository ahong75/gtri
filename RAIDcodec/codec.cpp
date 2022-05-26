#include <cstdlib>
#include <fstream>
#include <iostream>
#include <random>
#include <string>
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
  std::vector<std::vector<unsigned char>> output(height);
  for (int i = 0; i < height; i++) {
    std::vector<unsigned char> row;
    for (int j = 0; j < 3; j++) {
      // i is the index being represented as 3 bytes
      row.push_back(i >> (4 * j));
    }
    for (int j = 0; j < width; j++) {
      row.push_back(input[i * width + j]);
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
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      unsigned char cur = input[i][j];
      // Xoring the corresponding column byte
      output[height][j] ^= cur;
      // Xoring the row byte
      output[i][width] ^= cur;
      // Copying over payload byte
      output[i][j] = input[i][j];
    }
  }
  return output;
}

// Encodes a byte vector with a xor byte for each "column", and
// a xor byte for each "row". 3 index bytes  into a FASTA file called
// "encoded.fasta."
/**
  + -> payload byte
  e -> redundant byte
  f -> filler byte (has no purpose)
  +++    eee+++e
  +++    eee+++e
  +++ -> eee+++e
         eeeeeef
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
// concepts. Note that this version of the decode function cannot deal with
// erasures of entire rows / oligos or out of order rows because there is no
// indexing.
// Preconditions:
// No rows in the given FASTA file are out of order
// w and h are positive integers
// The size of the input array is equal to w * h
// The same w and h were used for the encoding of this FASTA file
std::vector<unsigned char> decode(std::ifstream &file, int width, int height) {
  // Array that will contain the reconstructed RAID array
  std::vector<std::vector<unsigned char>> arr;
  // Array that will store indices of rows with errors (erasure, IDS)
  std::vector<int> errors;
  std::string line;
  // Index for RAID array row
  int k = 0;
  while (getline(file, line)) {
    // Might not need the first check, as there never should be empty lines
    if (!line.empty() && line[0] != '>') {
      // Width + 1 columns, and 4 nucelotides per byte
      // This check is simple, if we decide to just leave the bottom-right
      // corner of the RAID array as padding
      if (line.length() != (width + 1) * 4) {
        errors.push_back(k);
        arr.push_back(std::vector<unsigned char>(width));
      } else {
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
        arr.push_back(row);
      }
      k++;
    }
  }
  file.close();
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
  std::vector<unsigned char> decoded(120);
  // Parse the RAID array to get the original data
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      decoded[width * i + j] = arr[i][j];
    }
  }
  return decoded;
}
