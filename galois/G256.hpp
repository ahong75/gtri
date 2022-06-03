#pragma once
#include <vector>
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
  G256();
};

// Class for a GF(2^8) field element. The basic arthimetic operators will
// generate another valid element.
class Elem {
public:
  G256 *field;
  u8 val;
  Elem(G256 *f, u8 n = 0);
  Elem operator+(const Elem &e);
  Elem operator-(const Elem &e);
  Elem operator*(const Elem &e);
  Elem operator/(const Elem &e);
};
} // namespace Galois
