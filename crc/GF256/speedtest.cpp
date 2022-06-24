#include "G256.hpp"
#include "crc.hpp"
#include <iostream>
#include <random>
typedef unsigned char u8;
using namespace std;

// Tests if no errors are detected with no errors applied
bool test1(crc &check) {
  random_device dev;
  mt19937 rng(dev());
  uniform_int_distribution<mt19937::result_type> dist(1, 255);
  vector<u8> arr(20);
  for (int i = 0; i < 20; i++) {
    arr[i] = dist(rng);
    cout << +arr[i] << " ";
  }
  cout << endl;
  check.encode(arr);
  return check.decode(arr);
}

// Tests if an error is detected with an error is applied to a single byte
bool test2(crc &check) {
  random_device dev;
  mt19937 rng(dev());
  uniform_int_distribution<mt19937::result_type> dist(1, 255);
  uniform_int_distribution<mt19937::result_type> dist2(0, 19);
  vector<u8> arr(20);
  for (int i = 1; i < 20; i++) {
    arr[i] = dist(rng);
  }
  int rand_index = dist2(rng);
  arr[rand_index] = dist(rng);
  int orig = arr[rand_index];
  check.encode(arr);
  arr[rand_index] = dist(rng);
  if (arr[rand_index] == orig) {
    return true;
  }
  return !check.decode(arr);
}

int main() {
  // how to test
  // error detection -> test if it detects errors
  // make a randomized 20 byte array
  // make 1-2 errors, see if its always detected, which it should be nearly 100%
  // of the time
  Galois::G256 field;
  crc check({1, 0, 1, 1, 1}, 5, 20, &field);
  random_device dev;
  mt19937 rng(dev());
  uniform_int_distribution<mt19937::result_type> dist(1, 255);
  uniform_int_distribution<mt19937::result_type> dist2(0, 19);
  vector<u8> orig(20);
  for (int i = 0; i < 20; i++) {
    orig[i] = dist(rng);
  }
  // for (int i = 0; i < 1000000; i++) {
  //   vector<u8> arr = orig;
  //   check.encode(arr);
  // }
  check.encode(orig);
  vector<u8> arr = orig;
  for (int i = 0; i < 1000000; i++) {
    vector<u8> arr = orig;
    check.encode(arr);
  }
}
