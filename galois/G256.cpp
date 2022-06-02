#pragma once
#include <vector>
// Remove the below includes later
#include <fstream>
#include <iostream>
typedef unsigned char u8;

// I should refactor this code later if it is used, with a seperate header file
// with declarations, as well as moving the testing code to a different source
// file
namespace Galois {
// Galois field for GF(2^8)
class G256 {
public:
  // Addition / subtraction are identical and just the xor operation
  std::vector<std::vector<u8>> mul;
  std::vector<std::vector<u8>> div;
  u8 mx;
  G256() {
    mx = 255;
    mul = std::vector<std::vector<u8>>(256, std::vector<u8>(256));
    // 255 because you cannot divide by 0
    div = std::vector<std::vector<u8>>(256, std::vector<u8>(255));
    // Create precalculated multiplication / division tables
    // Using ints because unsigned numbers will always be less than 256
    for (int i = 0; i < 256; i++) {
      for (int j = 0; j < 256; j++) {
        u8 a = static_cast<u8>(i);
        u8 b = static_cast<u8>(j);
        u8 p = 0;
        for (int k = 0; k < 8 && a != 0 && b != 0; k++) {
          if (b & 1) {
            p ^= a;
          }
          b >>= 1;
          // Potential for optimization here
          bool carry = a & (1 << 7);
          a <<= 1;
          if (carry) {
            // Binary literal suported by GCC, can change later if needed
            a ^= 0b11011;
          }
        }
        mul[i][j] = p;
        if (p == 0 && i == 1) {
          std::cout << +j << std::endl;
        }
        if (p != 0 && i != 0) {
          div[p][i - 1] = j;
        }
      }
    }
  }
};

// Class for a GF(2^8) field element. The basic arthimetic operators will
// generate another valid element.
class Elem {
public:
  G256 *field;
  u8 val;
  Elem(G256 *f, u8 n = 0) : val(n), field(f) {
    if (n > f->mx || n < 0) {
      throw std::invalid_argument("Out of range.");
    }
  };
  Elem operator+(const Elem &e) {
    Elem res(this->field);
    res.val = this->val ^ e.val;
    return res;
  }

  Elem operator-(const Elem &e) {
    Elem res(this->field);
    res.val = this->val ^ e.val;
    return res;
  }

  Elem operator*(const Elem &e) {
    Elem res(this->field);
    res.val = (field->mul)[this->val][e.val];
    return res;
  }

  Elem operator/(const Elem &e) {
    if (e.val == 0) {
      throw std::invalid_argument("Cannot divide by 0.");
    }
    Elem res(this->field);
    res.val = (field->div)[this->val][e.val - 1];
    return res;
  }
};
} // namespace Galois

using namespace std;
int main() {
  // Loading logarithm table
  vector<u8> log(256);
  ifstream file("log.txt");
  int index, num;
  while (file >> index, file >> num) {
    log[index] = num;
  }
  file.close();
  // Loading anti-logarithm table
  vector<u8> antilog(256);
  antilog[255] = 0;
  file.open("antilog.txt");
  while (file >> index, file >> num) {
    antilog[index] = num;
  }
  file.close();
  Galois::G256 field;
  for (int i = 0; i < 256; i++) {
    for (int j = 0; j < 256; j++) {
      cout << "Test for indices " << i << " " << j << ": ";
      u8 u = static_cast<u8>(i);
      u8 v = static_cast<u8>(j);
      Galois::Elem a(&field, u);
      Galois::Elem b(&field, v);
      // Addition / Subtraction
      if ((a + b).val == (u ^ v) && (a - b).val == (u ^ v)) {
        cout << "Addition / Subtraction Passed" << endl;
      } else {
        cout << +(a + b).val << " " << +(a - b).val << " " << +(u ^ v) << endl;
        return -1;
      }
      // Multiplication
      bool mul = 1;
      if (u == 0 || v == 0) {
        if ((a * b).val != 0) {
          cout << +(a * b).val << endl;
          mul = 0;
        }
      } else {
        // uint8_t will mod by 256 automatically
        if ((a * b).val != antilog[(log[i] + log[j]) % 255]) {
          mul = 0;
        }
      }
      if (mul) {
        cout << "Multiplication Passed" << endl;
      } else {
        cout << +(a * b).val << " " << +antilog[(log[i] + log[j]) % 255]
             << endl;
        return -1;
      }
      // Division
      bool div = 1;
      if (u == 0 && v != 0 && (a / b).val != 0) {
        div = 0;
      } else if (u != 0 && v != 0) {
        if ((a / b).val != antilog[(log[i] - log[j] + 255) % 255]) {
          div = 0;
        }
      }
      if (div) {
        cout << "Division Passed" << endl;
      } else {
        cout << +(a / b).val << " " << +antilog[(log[i] - log[j] + 255) % 255]
             << endl;
        return -1;
      }
    }
  }
}
