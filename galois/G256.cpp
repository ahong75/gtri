#include "G256.hpp"
#include <iostream>
#include <vector>
typedef unsigned char u8;

// I should refactor this code later if it is used, with a seperate header file
// with declarations, as well as moving the testing code to a different source
// file
namespace Galois {
G256::G256() {
  mx = 255;
  mul = std::vector<std::vector<u8>>(256, std::vector<u8>(256));
  // 255 because you cannot divide by 0
  div = std::vector<std::vector<u8>>(256, std::vector<u8>(255));
  // Create precalculated multiplication / division tables
  // Using ints because unsigned numbers will always be less than 256
  // Rijndael's (AES) finite field
  // https://en.wikipedia.org/wiki/Finite_field_arithmetic#Multiplication
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
      if (p != 0 && i != 0) {
        div[p][i - 1] = j;
      }
    }
  }
}
Elem::Elem(G256 *f, u8 n) : val(n), field(f) {
  if (n > f->mx || n < 0) {
    throw std::invalid_argument("Out of range.");
  }
};
Elem Elem::operator+(const Elem &e) {
  Elem res(this->field);
  res.val = this->val ^ e.val;
  return res;
}

Elem Elem::operator-(const Elem &e) {
  Elem res(this->field);
  res.val = this->val ^ e.val;
  return res;
}

Elem Elem::operator*(const Elem &e) {
  Elem res(this->field);
  res.val = (field->mul)[this->val][e.val];
  return res;
}

Elem Elem::operator/(const Elem &e) {
  if (e.val == 0) {
    throw std::invalid_argument("Cannot divide by 0.");
  }
  Elem res(this->field);
  res.val = (field->div)[this->val][e.val - 1];
  return res;
}
} // namespace Galois
