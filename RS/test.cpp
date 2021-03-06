#include "G256.hpp"
#include "rs.hpp"
#include <iostream>
#include <random>
typedef unsigned char u8;
using namespace std;

random_device dev;
// Seeded with 1234
mt19937 rng(123456);
uniform_int_distribution<mt19937::result_type> dist(1, 255);
uniform_int_distribution<mt19937::result_type> dist2(0, 20);
uniform_int_distribution<mt19937::result_type> dist3(1, 254);
// Tests if an error is detected with an error is applied to a single byte
// Tests if no errors are detected with no errors applied
bool test1(rs &check) {
  vector<u8> arr(253);
  for (int i = 0; i < 20; i++) {
    arr[i] = dist(rng);
  }
  // vector<u8> arr = {1};
  check.encode(arr);
  return check.decode(arr);
}

// Tests if an error is detected with an error is applied to a single byte
bool test2(rs &check) {
  vector<u8> arr(253);
  for (int i = 0; i < 20; i++) {
    arr[i] = dist(rng);
  }
  int rand_index = dist2(rng);
  check.encode(arr);
  arr[rand_index] = (arr[rand_index] + dist(rng)) % 256;
  return !check.decode(arr);
}

bool two_error_test(rs &check) {
  vector<u8> arr(253);
  for (int i = 233; i < 253; i++) {
    arr[i] = dist(rng);
  }
  int rand_index_one = dist2(rng);
  // int rand_index_two = (rand_index_one + dist3(rng)) % 255;
  int rand_index_two = (rand_index_one + dist3(rng)) % 255;
  if (rand_index_one == rand_index_two) {
    return true;
  }
  check.encode(arr);
  arr[rand_index_one] = (arr[rand_index_one] + dist(rng)) % 256;
  // arr[rand_index_two] = (arr[rand_index_two] + dist(rng)) % 256;
  arr[rand_index_two] = (arr[rand_index_two] + dist(rng)) % 256;
  if (!check.decode(arr)) {
    return true;
  } else {
    cout << rand_index_one << " " << rand_index_two << endl;
    return false;
  }
  // return !check.decode(arr);
}

bool three_error_test(rs &check) {
  vector<u8> arr(253);
  for (int i = 0; i < 20; i++) {
    arr[i] = dist(rng);
  }
  int rand_index_one = dist2(rng);
  // int rand_index_two = (rand_index_one + dist3(rng)) % 255;
  int rand_index_two = (rand_index_one + dist3(rng)) % 255;
  int rand_index_three = (rand_index_two + dist3(rng)) % 255;
  if (rand_index_one == rand_index_two || rand_index_one == rand_index_three || rand_index_two == rand_index_three) {
    return true;
  }
  check.encode(arr);
  arr[rand_index_one] = (arr[rand_index_one] + dist(rng)) % 256;
  // arr[rand_index_two] = (arr[rand_index_two] + dist(rng)) % 256;
  arr[rand_index_two] = (arr[rand_index_two] + dist(rng)) % 256;
  arr[rand_index_three] = (arr[rand_index_three] + dist(rng)) % 256;
  if (!check.decode(arr)) {
    return true;
  } else {
    return false;
  }
  // return !check.decode(arr);
}

bool custom_test(rs &check) {
  vector<u8> arr(253, 0);
  for (int i = 233; i < 253; i++) {
    arr[i] = i - 232;
    // arr[i - 233] = i - 232;
  }
  check.encode(arr);
  for (int i = 233; i < 255; i++) {
    cout << unsigned(arr[i]) << " ";
  }
  cout << endl;
  check.decode(arr);
  return true;
}
int main() {
  // how to test
  // error detection -> test if it detects errors
  // make a randomized 20 byte array
  // make 1-2 errors, see if its always detected, which it should be nearly 100%
  // of the time
  Galois::G256 field;
  rs check(3, 253, &field);
  int error_count = 0;
  for (int i = 0; i < 1000000; i++) {
    if (!two_error_test(check)) {
      cout << "Test " << i << " Failure" << endl;
      error_count++;
    }
  }
  cout << "Error count: " << error_count << endl;
}
