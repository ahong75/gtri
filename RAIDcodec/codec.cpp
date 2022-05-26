#include <cstdlib>
#include <ctime>
#include <fstream>
#include <iostream>
#include <random>
#include <string>
#include <vector>

// Constants that are determined by the user when passing in arguments to
// encode.
static int width = 1;
static int height = 1;

// Encodes a vector with a xor byte for each "column", and a xor
// byte for each "row".
/**
  +++    +++e
  +++    +++e
  +++ -> +++e
         eee
  **/
// Preconditions:
// w and h are positive integers
// The size of the input array is equal to w * h
void encode(std::vector<unsigned char> input, int w, int h) {
  if (input.size() != w * h) {
    std::cout << "The size of the input array does not equal w * h";
    return;
  }
  width = w;
  height = h;
  // Will store the new encoded RAID array
  std::vector<std::vector<unsigned char>> res(
      width + 1, std::vector<unsigned char>(height + 1));
  for (int i = 0; i < height; i++) {
    // Xor byte for the row
    unsigned char rbyte = 0;
    for (int j = 0; j < width; j++) {
      unsigned char cur = input[width * i + j];
      // Xoring the corresponding column byte
      res[height][j] ^= cur;
      // Xoring the row byte
      rbyte ^= cur;
      // Storing a payload byte
      res[i][j] = cur;
    }
    // Setting the row byte
    res[i][width] = rbyte;
  }
  // Outputting to fasta file. ios::trunc clears the file before writing to it
  std::ofstream output("encoded.fasta", std::ios::out | std::ios::trunc);
  for (int i = 0; i < height + 1; i++) {
    output << '>' << i + 1 << std::endl;
    for (int j = 0; j < width + 1; j++) {
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
  }
  output.close();
}

// Decode a FASTA file potentially containing IDS and erasure errors using RAID
// concepts. Note that this version of the decode function cannot deal with
// erasures of entire rows / oligos or out of order rows because there is no
// indexing.
// Preconditions:
// No rows in the given FASTA file are out of order
std::vector<unsigned char> decode(std::ifstream &file) {
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
        arr.push_back({});
      } else {
        std::vector<unsigned char> row(width + 1);
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
            byte &= (nibble << (2 * j));
          }
          row[i] = byte;
        }
        arr[k] = row;
      }
      k++;
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
      unsigned char pbyte = arr[height][i];
      for (int j = 0; j < height; j++) {
        pbyte ^= arr[i][j];
      }
      // Setting the corrected byte
      arr[wrong][i] = pbyte;
    }
  }
  // Array to store decoded data
  std::vector<unsigned char> decoded(width * height);
  // Parse the RAID array to get the original data
  for (int i = 0; i < height; i++) {
    for (int j = 0; j < width; j++) {
      decoded[width * i + j] = arr[i][j];
    }
  }
  return decoded;
}

std::random_device dev;
std::mt19937 rng(dev());
std::uniform_int_distribution<std::mt19937::result_type> dist1(1, 255);

int main() {
  // how to test
  // make random vector size 120 and pass it into encode
  // choose random number from 1 to 130 (10 xor bytes)
  // find that bytes' coordinates and then set it to 0 (erasure)
  // pass it into decode, and see if original vector matches decoded vector

  // ideally these prompts will be addressed in a passed in JSON file
  std::cout << "Enter in the width of each RAID array: ";
  std::cin >> width;
  std::cout << "Enter in the height of each RAID array: ";
  std::cin >> height;
}
