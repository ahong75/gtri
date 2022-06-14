#include "G256log.hpp"
#include <fstream>
#include <iostream>
#include <vector>

typedef unsigned char u8;

// I should refactor this code later if it is used, with a seperate header file
// with declarations, as well as moving the testing code to a different source
// file
namespace Galois {
G256::G256() {
  mx = 255;
  // loading logarithm table
  log = std::vector<u8>(256);
  std::ifstream file("log.txt");
  int index, num;
  while (file >> index, file >> num) {
    log[index] = num;
  }
  file.close();
  // loading anti-logarithm table
  // We are doubling the size of the anti-log table so we don't have to mod the
  // result and waste a small amount of time.
  antilog = std::vector<u8>(512);
  file.open("antilog.txt");
  while (file >> index, file >> num) {
    antilog[index] = num;
  }
  file.close();
  for (int i = 255; i < 512; i++) {
    antilog[i] = antilog[i - 255];
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
  if (this->val == 0 || e.val == 0) {
    res.val = 0;
  } else {
    res.val = (field->antilog)[(field->log)[e.val] + (field->log)[this->val]];
  }
  return res;
}

Elem Elem::operator/(const Elem &e) {
  if (e.val == 0) {
    throw std::invalid_argument("Cannot divide by 0.");
  }
  Elem res(this->field);
  if (this->val == 0) {
    res.val = 0;
  } else {
    res.val =
        (field->antilog)[((field->log)[this->val] + 255 - (field->log)[e.val]) %
                         255];
  }
  return res;
}
} // namespace Galois
