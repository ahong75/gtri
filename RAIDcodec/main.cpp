#include "codec.hpp"
#include <fstream>
#include <iostream>
#include <random>
#include <string>
#include <vector>

std::random_device dev;
std::mt19937 rng(dev());
std::uniform_int_distribution<std::mt19937::result_type> dist1(1, 255);

// Simply tests if the codec can encode and decode the original file when there
// are zero errors
void test(int width, int height) {
  std::vector<unsigned char> orig(width * height);
  for (int i = 0; i < width * height; i++) {
    orig[i] = i;
  }
  encode(orig, width, height);
  std::vector<unsigned char> decoded = decode("encoded.fasta", width, height);
  if (orig == decoded) {
    std::cout << "Passed" << std::endl;
  } else {
    std::cout << "Failed" << std::endl;
  }
}

int main() {
  // What needs to be tested:
  // Whether the program can encode and decode with 0 errors
  // Simply pass in the outputted fasta
  // Whether it can recover from different types of errors

  for (int i = 0; i < 100; i++) {
    test(10, 12);
  }
}
