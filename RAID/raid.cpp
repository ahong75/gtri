#include <cstdlib>
#include <ctime>
#include <iostream>
#include <random>
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
// which byte is missing (0 indexed)
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
std::uniform_int_distribution<std::mt19937::result_type>
    dist2(0, (width + 1) * height - 1);

int main() {
  // how to test
  // make random vector size 120 and pass it into encode
  // choose random number from 1 to 130 (10 xor bytes)
  // find that bytes' coordinates and then set it to 0 (erasure)
  // pass it into decode, and see if original vector matches decoded vector
  for (int i = 0; i < 100; i++) {
    std::vector<unsigned char> orig(width * height);
    for (int i = 0; i < width * height; i++) {
      orig[i] = dist1(rng);
    }
    std::vector<unsigned char> encoded = encode(orig);
    int remove = dist2(rng);
    std::cout << "Original Byte: " << +encoded[remove] << std::endl;
    encoded[remove] = 0;
    std::vector<unsigned char> decoded = decode(encoded, remove);
    if (orig == decoded) {
      std::cout << "Passed" << std::endl;
    } else {
      std::cout << "Failed" << std::endl;
    }
  }
}
