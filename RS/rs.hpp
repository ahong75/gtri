#include "G256.hpp"
#include <vector>
typedef unsigned char u8;
class rs {
public:
  // instance vars:
  // polynomial
  // data length in bytes
  // functions:
  // encode (takes in a byte vector and returns a byte vector with an appended
  // crc) decode (takes in a byte vector and returns a bool, indicating whether
  // an error is detected)
  std::vector<Galois::Elem> poly;
  // Used to store the zeroes of the generator polynomial. Needed for error
  // detection
  std::vector<Galois::Elem> zeroes;
  Galois::G256 *field;
  int data_length;
  int poly_length;
  rs(int p, int d, Galois::G256 *field);
  std::vector<Galois::Elem> gen_poly();
  std::vector<Galois::Elem> poly_mul(std::vector<Galois::Elem> a,
                                     std::vector<Galois::Elem> b);
  void mod(std::vector<Galois::Elem> &rem);
  // Encode function that takes in a byte vector and calculates and appends the
  // CRC. Might want to change this to a static function later on when we're
  // just going to be using a single polynomial anyways.
  void encode(std::vector<u8> &input);
  // Decode function that takes in an encoded byte vector and returns whether or
  // not an error has been detected according to the CRC
  bool decode(std::vector<u8> &input);
};
