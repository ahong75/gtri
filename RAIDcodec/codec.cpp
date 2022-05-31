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
// Indexing bytes used to establish order
static int ibytes = 3;

// Helper function for the encode function that takes in an array of unsigned
// characters and segments it into rows while adding indexing to each row.
std::vector<std::vector<unsigned char>>
file_system(std::vector<unsigned char> &input, int width, int height) {
  // Height + 1 to account for indexing of the parity check row
  std::vector<std::vector<unsigned char>> output(height);
  for (int i = 0; i < height; i++) {
    std::vector<unsigned char> row(width + ibytes);
    for (int j = 0; j < ibytes; j++) {
      // i is the index being represented as 3 bytes
      row[j] = (i >> (8 * (ibytes - 1 - j))) & 255;
    }
    for (int j = 0; j < width; j++) {
      row[j + ibytes] = input[i * width + j];
    }
    output[i] = row;
  }
  return output;
}

// In-place helper function for the encode function that appends an extra parity
// row to a given 2D array
void outer_encode(std::vector<std::vector<unsigned char>> &input, int width,
                  int height) {
  input.push_back(std::vector<unsigned char>(width, 0));
  for (int i = 0; i < height; i++) {
    for (int j = ibytes; j < width; j++) {
      input[height][j] ^= input[i][j];
    }
  }
  for (int i = 0; i < ibytes; i++) {
    // Indexing the extra parity row
    input[height][i] = ((height + 1) >> (8 * (ibytes - 1 - i))) & 255;
  }
}

// In-place helper function for the encode function that adds a parity byte to
// each row of a given 2D array
void inner_encode(std::vector<std::vector<unsigned char>> &input, int width,
                  int height) {
  for (int i = 0; i < height; i++) {
    input[i].push_back(0);
    for (int j = 0; j < width; j++) {
      // Xoring the row byte
      input[i][width] ^= input[i][j];
    }
  }
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
  // Applying file_system (indexing and metadata)
  std::vector<std::vector<unsigned char>> res =
      file_system(input, width, height);
  // Applying outer codec
  outer_encode(res, res[0].size(), res.size());
  // Applying inner codec
  inner_encode(res, res[0].size(), res.size());
  // Outputting to fasta file. ios::trunc clears the file before writing to it
  std::ofstream output("encoded.fasta", std::ios::out | std::ios::trunc);
  for (int i = 0; i < res.size(); i++) {
    // Outputting label
    output << '>' << i + 1 << std::endl;
    // Converting bits to nucleotides: 2 bits -> 1 nucleotide
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

// Helper function for the decode function. Returns false if the length of the
// input row is incorrect or it does not pass the row-wise parity check. Returns
// true otherwise.
bool inner_decode(std::vector<unsigned char> &input, int width) {
  // If the length is wrong, then some combination of errors has occured
  if (input.size() != width + ibytes) {
    return false;
  }
  unsigned char pbyte = 0;
  for (unsigned char c : input) {
    pbyte ^= c;
  }
  if (pbyte != 0) {
    return false;
  }
  return true;
}

// Helper function for the decode function. Should take in an error containing
// indices of rows with known errors, the constructed RAID array, as well as the
// height and width as parameters.
bool outer_decode(std::vector<std::vector<unsigned char>> &input,
                  vector<int> &errors, int width, int height) {
  // Seeing which indices were not received
  for (int i = 0; i < height; i++) {
    if (input[i].empty()) {
      errors.push_back(i);
    }
  }
  if (errors.size() > 1) {
    // If there is more than one row with errors we cannot recover the data
    return false;
  } else if (errors.empty()) {
    // If there are no errors from checking the row parity bytes, we will check
    // the column bytes
    for (int j = 0; j < width; j++) {
      unsigned char pbyte = 0;
      for (int i = 0; i < height; i++) {
        pbyte ^= input[i][j];
      }
      // The column has an error, which we cannot correct
      if (pbyte != 0) {
        return false;
      }
    }
    // We can only correct errors if there's exactly 1 row with incorrect parity
  } else {
    // Index of row with error
    int wrong = errors.front();
    input[wrong] = std::vector<unsigned char>(width);
    for (int i = 0; i < width; i++) {
      // The parity byte of the current corresponding column
      unsigned char pbyte = 0;
      for (int j = 0; j < height; j++) {
        if (j != wrong) {
          pbyte ^= input[j][i];
        }
      }
      // Setting the corrected byte
      input[wrong][i] = pbyte;
    }
  }
  return true;
}

// Helper function for the decode function. Converts the constructed RAID array
// back into a 1D vector
std::vector<unsigned char>
decode_file_system(std::vector<std::vector<unsigned char>> &input, int width,
                   int height) {
  // Array to store decoded data
  std::vector<unsigned char> decoded(height * width);
  // Parse the RAID array to get the original data
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      decoded[width * i + j] = arr[i][j];
      // std::cout << +decoded[width * i + j] << " ";
    }
    // std::cout << std::endl;
  }
  return decoded;
}
// Decode a FASTA file potentially containing IDS and erasure errors using
// RAID concepts. Preconditions: w and h are positive integers The size of
// the input array is equal to w * h The same w and h were used for the
// encoding of this FASTA file
std::vector<unsigned char> decode(std::string filename, int width, int height) {
  // Array that will contain the reconstructed RAID array
  std::vector<std::vector<unsigned char>> res(height + 1);
  // Array that will store indices of rows with errors (erasure, IDS)
  std::vector<int> errors;
  std::ifstream file(filename);
  std::string line;
  while (getline(file, line)) {
    // Might not need the first check, as there never should be empty lines
    if (!line.empty() && line[0] != '>') {
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
      // Inner decode on the row checks if it contains an error
      if (inner_decode(row, width)) {
        // Extracting index
        int index = 0;
        for (int i = 0; i < ibytes; i++) {
          index |= (row[i] << ((ibytes - 1 - i) * 8));
        }
        // Ideally would factor in consensus finding. Right now always overwrite
        // with most recent read.
        res[index] =
            std::vector<unsigned char>(row.begin() + ibytes, row.end());
      }
    }
  }
  file.close();
  if (!outer_decode(res, errors, width, height)) {
    return {};
  }
  return decode_file_system(res, width, height);
}
