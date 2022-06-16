#include "rs.hpp"
#include "G256.hpp"
#include <stdexcept>
#include <vector>
// take out later
#include <iostream>
typedef unsigned char u8;

rs::rs(int p, int d, Galois::G256 *f) {
  field = f;
  data_length = 251;
  poly_length = p;
  // The size of the generator polynomial vector is 3 because it is a degree 2
  // polynomial.
  zeroes.push_back(Galois::Elem(field, 1));
  zeroes.push_back(Galois::Elem(field, 2));
  poly = gen_poly();
  // We are hardcoding the result of (x - 2^0)(x - 2^1)(x - 2^2)(x -
  // 2^3) where the coefficients are in GF(256)
  // Data length should be 251 because the size of the remainder will be 4 bytes
  // and the size of the data + the remainder should be 255
}

std::vector<Galois::Elem> rs::gen_poly() {
  std::vector<Galois::Elem> res;
  res.push_back(Galois::Elem(field, 1));
  for (int i = 0; i < 2; i++) {
    std::vector<Galois::Elem> factor;
    factor.push_back(Galois::Elem(field, 1));
    factor.push_back(zeroes[i]);
    res = poly_mul(res, factor);
  }
  return res;
}

std::vector<Galois::Elem> rs::poly_mul(std::vector<Galois::Elem> a,
                                       std::vector<Galois::Elem> b) {
  std::vector<Galois::Elem> res(a.size() + b.size() - 1,
                                Galois::Elem(field, 0));
  for (int i = 0; i < b.size(); i++) {
    for (int j = 0; j < a.size(); j++) {
      res[i + j] = res[i + j] + (b[i] * a[j]);
    }
  }
  return res;
}
void rs::mod(std::vector<Galois::Elem> &rem) {
  // degree of the highest order term in the poly
  // Can actually calculate this in the crc constructor
  int pdegree = 0;
  for (int i = 0; i < poly.size(); i++) {
    if (poly[i].val != 0) {
      pdegree = poly.size() - i - 1;
      break;
    }
  }
  // Boolean that tracks whether or not it is possible to divide the
  // remaining number by the dividend
  bool divide = true;
  while (divide) {
    // Quotient term initially defaulted to 0
    Galois::Elem quotient(field, 0);
    // Degree of current term of the quotient
    int qdegree = 0;
    // We assume that each iteration is the last divison we can perform on the
    // remainder unless proven otherwise
    divide = false;
    // Iterating through the current remainder
    // This could probably be optimized
    for (int j = 0; j < rem.size(); j++) {
      // If the highest possible x degree term has not been found yet, check
      // if the current term is non zero and that its degree is greater than
      // or equal to the polynomial degree
      int ddegree = rem.size() - j - 1;
      if (rem[j].val != 0 && ddegree >= pdegree) {
        divide = true;
        // Dividing the highest order term in the remainder by the highest
        // order term in the generator polynomial in GF(256)
        quotient = rem[j] / poly[pdegree];
        qdegree = ddegree - pdegree;
        // With this operation, the highest term in the remainder will be
        // canceled out.
        rem[j].val = 0;
        for (int i = poly.size() - pdegree; i < poly.size(); i++) {
          if (poly[i].val != 0) {
            // Degree of product between quotient term and current generator
            // polynomial term
            int curdegree = (poly.size() - i - 1) + qdegree;
            // We xor, because that is addition/subtraction in GF(256); Think
            // of normal polynomial long division
            rem[rem.size() - curdegree - 1] =
                rem[rem.size() - curdegree - 1] - (poly[i] * quotient);
          }
        }
      }
    }
  }
}

void rs::encode(std::vector<u8> &input) {
  // Check to see if the input size matches the required length
  if (data_length != input.size()) {
    throw std::invalid_argument(
        "The length of the vector is the wrong size for crc encoding.");
  }
  // Vector representing the remainder of the polynomial divide, which is the
  // crc itself
  // Wrapping once at the begin and unwrapping at the end is better than
  // constantly wrapping and unwrapping during the operations.
  std::vector<Galois::Elem> rem;
  for (int i = 0; i < data_length; i++) {
    rem.push_back(Galois::Elem(field, input[i]));
  }
  // Pushing back the zeroed crc
  for (int i = 0; i < poly_length - 1; i++) {
    rem.push_back(Galois::Elem(field, 0));
  }
  mod(rem);
  for (int i = data_length; i < data_length + poly_length - 1; i++) {
    input.push_back(rem[i].val);
  }
}
bool rs::decode(std::vector<u8> &input) {
  // Encoded vector should have data bytes + poly_length - 1 crc bytes
  if (data_length + poly_length - 1 != input.size()) {
    std::cout << input.size() << std::endl;
    throw std::invalid_argument(
        "The length of the vector is the wrong size for crc decoding.");
  }
  std::vector<Galois::Elem> rem;
  for (int i = 0; i < input.size(); i++) {
    rem.push_back(Galois::Elem(field, input[i]));
  }
  mod(rem);
  // Removing the crc
  for (int i = 0; i < poly_length - 1; i++) {
    input.pop_back();
  }
  // Checking if the remainder of the division is 0
  for (int i = data_length; i < data_length + poly_length - 1; i++) {
    if (rem[i].val != 0) {
      return false;
    }
  }
  return true;
}
