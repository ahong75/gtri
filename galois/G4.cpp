#pragma once
#include <vector>
// Remove the below line later
#include <iostream>
typedef unsigned char u8;

// I should refactor this code later if it is used, with a seperate header file
// with declarations, as well as moving the testing code to a different source
// file
namespace Galois {
// Galois field for GF(2^2)
class G4 {
public:
  // Addition / subtraction are identical and just the xor operation
  std::vector<std::vector<u8>> mul;
  std::vector<std::vector<u8>> div;
  u8 mx;
  G4() {
    // Hard-coded lookup tables for multiplication/division
    mx = 3;
    mul = {{0, 0, 0, 0}, {0, 1, 2, 3}, {0, 2, 3, 1}, {0, 3, 1, 2}};
    div = {{0, 0, 0}, {1, 3, 2}, {2, 1, 3}, {3, 2, 1}};
  }
};

// Class for a GF(2^2) field element. The basic arthimetic operators will
// generate another valid element.
class Elem {
public:
  G4 *field;
  u8 val;
  Elem(G4 *f, u8 n = 0) : val(n), field(f) {
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
  vector<vector<u8>> addtests = {
      {0, 1, 2, 3}, {1, 0, 3, 2}, {2, 3, 0, 1}, {3, 2, 1, 0}};
  vector<vector<u8>> multests = {
      {0, 0, 0, 0}, {0, 1, 2, 3}, {0, 2, 3, 1}, {0, 3, 1, 2}};
  vector<vector<u8>> divtests = {{0, 0, 0}, {1, 3, 2}, {2, 1, 3}, {3, 2, 1}};
  Galois::G4 field;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      Galois::Elem first(&field, i);
      Galois::Elem second(&field, j);
      if ((first + second).val == addtests[i][j]) {
        cout << "Success" << endl;
      } else {
        cout << "Failure on addtests with indices " << i << " " << j << endl;
      }
      if ((first * second).val == multests[i][j]) {
        cout << "Success" << endl;
      } else {
        cout << "Failure on multests with indices " << i << " " << j << endl;
      }
      if (second.val != 0) {
        if ((first / second).val == divtests[i][j - 1]) {
          cout << "Success" << endl;
        } else {
          cout << "Failure on divtests with indices " << i << " " << j << endl;
        }
      }
    }
  }
}
