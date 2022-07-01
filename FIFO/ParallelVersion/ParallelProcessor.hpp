#pragma once
#include <vector> 
#include "InnerRS.hpp"
typedef unsigned char u8;

// Struct that acts as a wrapper to an oligo read 
struct Read {
  // Is false if the inner_decode detected an error
  bool valid;
  std::vector<u8> data;
  int chunk_index = 0;
  int col_index = 0;
};

class ParallelProcessor {
  public:
  rs decoder;
  // Each parallel processor instance will need an RS code object
  ParallelProcessor(rs r) : decoder(r) {};

  // Change so you pass in a read by reference. That way you don't always have to 
  // return a Read struct
  Read inner_decode(std::vector<u8> input);
  // bool inner_decode(std::vector<u8> input, Read &read);
};
