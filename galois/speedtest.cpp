#include "G256.hpp"
#include <fstream>
#include <iostream>
#include <vector>
using namespace std;
int main() {
  // Loading logarithm table
  // vector<u8> log(256);
  // ifstream file("log.txt");
  // int index, num;
  // while (file >> index, file >> num) {
  //   log[index] = num;
  // }
  // file.close();
  // // Loading anti-logarithm table
  // vector<u8> antilog(256);
  // antilog[255] = 0;
  // file.open("antilog.txt");
  // while (file >> index, file >> num) {
  //   antilog[index] = num;
  // }
  // file.close();
  Galois::G256 field;
  Galois::Elem a(&field, 10);
  Galois::Elem b(&field, 20);
  for (long long i = 0; i < 1000000000; i++) {
      // cout << "Test for indices " << i << " " << j << ": ";
      // u8 u = static_cast<u8>(i);
      // u8 v = static_cast<u8>(j);
      Galois::Elem c = a * b;
      // Addition / Subtraction
      // if ((a + b).val == (u ^ v) && (a - b).val == (u ^ v)) {
      //   cout << "Addition / Subtraction Passed" << endl;
      // } else {
      //   cout << +(a + b).val << " " << +(a - b).val << " " << +(u ^ v) << endl;
      //   return -1;
      // }
      // // Multiplication
      // bool mul = 1;
      // if (u == 0 || v == 0) {
      //   if ((a * b).val != 0) {
      //     cout << +(a * b).val << endl;
      //     mul = 0;
      //   }
      // } else {
      //   // uint8_t will mod by 256 automatically
      //   if ((a * b).val != antilog[(log[i] + log[j]) % 255]) {
      //     mul = 0;
      //   }
      // }
      // if (mul) {
      //   cout << "Multiplication Passed" << endl;
      // } else {
      //   cout << +(a * b).val << " " << +antilog[(log[i] + log[j]) % 255]
      //        << endl;
      //   return -1;
      // }
      // // Division
      // bool div = 1;
      // if (u == 0 && v != 0 && (a / b).val != 0) {
      //   div = 0;
      // } else if (u != 0 && v != 0) {
      //   if ((a / b).val != antilog[(log[i] - log[j] + 255) % 255]) {
      //     div = 0;
      //   }
      // }
      // if (div) {
      //   cout << "Division Passed" << endl;
      // } else {
      //   cout << +(a / b).val << " " << +antilog[(log[i] - log[j] + 255) % 255]
      //        << endl;
      //   return -1;
      // }
  }
}
