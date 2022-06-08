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
  vector<u8> orig;
  check.encode(arr);
  return check.decode(arr);
}

// Tests if an error is detected with an error is applied to a single byte
bool test2(crc &check) {
  random_device dev;
  mt19937 rng(dev());
  uniform_int_distribution<mt19937::result_type> dist(1, 255);
  vector<u8> arr(20);
  for (int i = 0; i < 20; i++) {
    arr[i] = dist(rng);
  }
  vector<u8> orig;
  check.encode(arr);
  arr[0] = 0;
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
  cout << "0 error tests" << endl;
  for (int i = 0; i < 1000; i++) {
    cout << "Test " << i << " ";
    if (test1(check)) {
      cout << "Success";
    } else {
      cout << "Failure";
      return -1;
    }
    cout << endl;
  }
  cout << "1 error tests" << endl;
  for (int i = 0; i < 1000; i++) {
    cout << "Test " << i << endl;
    if (test2(check)) {
      cout << "Success";
    } else {
      cout << "Failure";
      return -1;
    }
    cout << endl;
  }
}
