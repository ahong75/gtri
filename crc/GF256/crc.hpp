#include "G256.hpp"
#include <vector>
typedef unsigned char u8;
class crc {
  // instance vars:
  // polynomial
  // data length in bytes
  // functions:
  // encode (takes in a byte vector and returns a byte vector with an appended
  // crc) decode (takes in a byte vector and returns a bool, indicating whether
  // an error is detected)
  std::vector<Galois::Elem> poly;
  int data_length;
  int poly_length;
  crc(std::vector<u8> input, int p, int d, Galois::G256 &field);

  std::vector<u8> divide(std::vector<Galois::Elem> &rem, Galois::G256 &field);
  // Encode function that takes in a byte vector and calculates and appends the
  // CRC. Might want to change this to a static function later on when we're
  // just going to be using a single polynomial anyways.
  void encode(std::vector<u8> &input, Galois::G256 &field);
  // Decode function that takes in an encoded byte vector and returns whether or
  // not an error has been detected according to the CRC
  bool decode(std::vector<u8> &input, Galois::G256 &field);
};
