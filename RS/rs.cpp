#include "rs.hpp"
#include "G256.hpp"
#include <stdexcept>
#include <vector>
// take out later
#include <iostream>
typedef unsigned char u8;

// Helper function for the constructor that creates a vector representing the
// generator polynomial. Currently it is hardcoded for the polynomial (x - 1)(x
// - 2)
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

rs::rs(int p, int d, Galois::G256 *f) {
  field = f;
  // The data length is currently assumed to be 253 and the poly length 3
  data_length = d;
  poly_length = p;
  // The size of the generator polynomial vector is 3 because it is a degree 2
  // polynomial.

  // Hard coding the two zeroes in (x - a^0)(x - a^1). 2^0 = 1 and 2^1 = 2. If
  // using a bigger gen poly later on, should remember that the powers of alpha
  // should be calculated in GF(256)
  zeroes.push_back(Galois::Elem(field, 1));
  zeroes.push_back(Galois::Elem(field, 3));
  poly = gen_poly();
}

// Helper function for polynomial multiplication with coefficients in GF(256)
std::vector<Galois::Elem> rs::poly_mul(std::vector<Galois::Elem> a,
                                       std::vector<Galois::Elem> b) {
  std::vector<Galois::Elem> res(a.size() + b.size() - 1,
                                Galois::Elem(field, 0));
  for (int i = 0; i < b.size(); i++) {
    for (int j = 0; j < a.size(); j++) {
      res[i + j] = res[i + j] + (a[j] * b[i]);
    }
  }
  return res;
}

void rs::mod(std::vector<Galois::Elem> &rem) {
  // degree of the highest order term in the poly
  // Can actually calculate this in the constructor
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
        quotient = rem[j] / poly[0];
        qdegree = ddegree - pdegree;
        // With this operation, the highest term in the remainder will be
        // canceled out.
        rem[j].val = 0;
        for (int i = 1; i < poly.size(); i++) {
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
  // Vector representing the polynomial with Galois element wrapping and
  // appended zero bytes for where the remainder will go. Wrapping once at the
  // begin and unwrapping at the end is better than constantly wrapping and
  // unwrapping during the operations.
  std::vector<Galois::Elem> rem;
  for (int i = 0; i < data_length; i++) {
    rem.push_back(Galois::Elem(field, input[i]));
  }
  // Pushing back the zeroed remainder
  for (int i = 0; i < poly_length - 1; i++) {
    rem.push_back(Galois::Elem(field, 0));
  }
  mod(rem);
  for (int i = data_length; i < data_length + poly_length - 1; i++) {
    input.push_back(rem[i].val);
  }
}

// Helper function for the decode function. Evaluates a polynomial expression at
// x. Implemented using Horner's scheme:
// https://en.wikipedia.org/wiki/Horner%27s_method
Galois::Elem poly_eval(std::vector<Galois::Elem> poly, Galois::Elem x) {
  Galois::Elem res = poly[0];
  for (int i = 1; i < poly.size(); i++) {
    res = (res * x) + poly[i];
  }
  return res;
}

bool rs::decode(std::vector<u8> &input) {
  // Encoded vector should have data bytes + poly_length - 1 remainder bytes
  if (data_length + poly_length - 1 != input.size()) {
    std::cout << input.size() << std::endl;
    throw std::invalid_argument(
        "The length of the vector is the wrong size for crc decoding.");
  }
  std::vector<Galois::Elem> rem;
  for (int i = 0; i < input.size(); i++) {
    rem.push_back(Galois::Elem(field, input[i]));
  }
  // Removing the remainder bytes
  for (int i = 0; i < poly_length - 1; i++) {
    input.pop_back();
  }
  for (int i = 0; i < zeroes.size(); i++) {
    if (poly_eval(rem, zeroes[i]).val != 0) {
      return false;
    }
  }
  return true;
}
