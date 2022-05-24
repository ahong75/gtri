#include <cstdlib>
#include <ctime>
#include <iostream>
#include <random>
#include <vector>

// constants that are determined by the user
static int width = 1;
static int height = 1;

// encodes a vector with a xor byte for each "column" and a xor byte for each
// "row" this means the resulting structure of the array visualized in 2D is
// missing the bottom-right corner entry
/**
  +++    +++e
  +++    +++e
  +++ -> +++e
         eee
  **/
std::vector<unsigned char> encode(std::vector<unsigned char> input) {
  // A new array must be initalized bc for the row bytes, it's not efficient to
  // shift everything ahead of it 1 spot forwards each time.
  std::vector<unsigned char> res((width + 1) * (height + 1) - 1);
  for (int i = 0; i < height; i++) {
    // xor byte for the row
    unsigned char rbyte = 0;
    for (int j = 0; j < width; j++) {
      unsigned char cur = input[width * i + j];
      // xoring the correct byte on the appended row
      res[(width + 1) * height + j] ^= cur;
      rbyte ^= cur;
      res[width * i + j] = cur;
    }
    // setting the row byte
    res[i * (width + 1)] = rbyte;
  }
  return res;
}

// decodes a vector with IDS and erasure error using RAID
std::vector<unsigned char> decode(std::vector<unsigned char> input, int num) {
  int col = num % width;
  // deal with the case where the corrupted byte is a parity byte
  if (input.size() - num >= width) {
    unsigned char pbyte = input[width * height + col];
    for (int i = 0; i < height; i++) {
      if (width * i + col != num) {
        pbyte ^= input[width * i + col];
      }
    }
    std::cout << "Recovered Byte: " << +pbyte << std::endl;
    input[num] = pbyte;
  } else {
    std::cout << "Corrupted Byte is a XOR Byte" << std::endl;
  }
  return std::vector<unsigned char>(input.begin(), input.end() - width);
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
  std::cout << "Enter in the width of each RAID array: ";
  std::cin >> width;
  std::cout << "Enter in the height of each RAID array: ";
  std::cin >> height;
  for (int i = 0; i < 100; i++) {
    std::vector<unsigned char> orig(width * height);
    for (int i = 0; i < width * height; i++) {
      orig[i] = dist1(rng);
    }
    std::vector<unsigned char> encoded = encode(orig);
    // applyError(encoded);
    std::vector<unsigned char> decoded = decode(encoded);
    if (orig == decoded) {
      std::cout << "Passed" << std::endl;
    } else {
      std::cout << "Failed" << std::endl;
    }
  }
}
