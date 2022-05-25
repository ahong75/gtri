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
      res[height + 1][j] ^= cur;
      // Xoring the row byte
      rbyte ^= cur;
      res[i][j] = cur;
    }
    // Setting the row byte
    res[i][width + 1] = rbyte;
  }
  // Outputting to fasta file. ios::trunc clears the file before writing to it
  std::ofstream output("encoded.fasta", std::ios::out | std::ios::trunc);
  for (int i = 0; i < height + 1; i++) {
    std::cout << '>' << i + 1 << std::endl;
    for (int j = 0; j < width + 1; j++) {
      // Mask is 3 because 3 = 11b
      for (int k = 0; k < 8; k += 2) {
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

// decode vector with IDS and erasure error using RAID
// note that this version of decode cannot deal with erasures of entire rows
// because there is no indexing
// another assumption made is that the rows in the FASTA file are in the correct
// order
std::pair<bool, std::vector<unsigned char>>
decode(std::vector<unsigned char> input) {
  // Iterate through entire array while checking which rows have an error
  std::vector<int> errors;
  for (int i = 0; i < height + 1; i++) {
    unsigned char pbyte = 0;
    for (int j = 0; j < width + 1; j++) {
      pbyte ^= input[i * (width + 1) + j]; // calculating parity
    }
    if (pbyte != 0) {
      errors.push_back(i);
    }
  }
  if (errors.size() > 1) {
    return {false, input};
  } else if (errors.size() == 1) {
    // where the corrected bytes will be stored
    std::vector<unsigned char> corrected(width);
    for (int i = 0; i < width; i++) {
    }
    for (int i = 0; i < height; i++) {
      if (i == errors.front())
        continue;
      for (int j = 0; j < width; j++) {
        corrected[j] ^
      }
    }
  }
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
