#pragma once
#include <vector>
typedef unsigned char u8;

// I should refactor this code later if it is used, with a seperate header file
// with declarations, as well as moving the testing code to a different source
// file
namespace Galois {
class G4 {
public:
  // Addition / subtraction are identical and just the xor operation
  std::vector<std::vector<u8>> mul;
  std::vector<std::vector<u8>> div;
  G4() {
    // Hard-coded lookup tables for multiplication/division
    mul = {{0, 1, 2, 3}, {1, 0, 3, 2}, {2, 3, 0, 1}, {3, 2, 1, 0}};
    div = {{0, 0, 0}, {1, 3, 2}, {2, 1, 3}, {3, 2, 1}};
  }
};

class Elem {
public:
  Elem(G4 *f, u8 n = 0) : val(n), field(f){};
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
    Elem res(this->field);
    res.val = (field->div)[this->val][e.val];
    return res;
  }

private:
  G4 *field;
  u8 val;
};
} // namespace Galois
