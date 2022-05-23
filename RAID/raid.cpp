#include <cstdlib>
#include <iostream>
#include <vector>

// constants that depend on the size of the input vector
const int width = 10;
const int height = 12;

// encodes a vector with a xor byte for each "column"
std::vector<unsigned char> encode(std::vector<unsigned char> input) {
  for (int i = 0; i < width; i++) {
    unsigned char pbyte = 0; // the parity byte for the current column
    for (int j = 0; j < height; j++) {
      pbyte ^= input[width * j + i]; // xoring the ith byte in the jth row
    }
    input.push_back(pbyte);
  }
  return input;
}

// decodes a vector with a single corrupted byte, given the encoded vector and
// location of the missing byte
std::vector<unsigned char> decode(std::vector<unsigned char> input,
                                  std::pair<int, int> missing) {
  int row = missing.first;
  int col = missing.second;
  // deal with the case where the corrupted byte is a parity byte
  if (row != height + 1) {
    unsigned char pbyte = input[width * height + col];
    for (int i = 0; i < height; i++) {
      if (i != row) {
        pbyte ^= input[width * i + col];
      }
    }
    input[width * row + col] = pbyte;
  }
  return std::vector<unsigned char>(input.begin(), input.end() - width);
}
int main() { return 0; }
