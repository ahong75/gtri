#include <vector> 
#include "../../RS/rs.hpp"
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
  rs decoder;
  // Each parallel processor instance will need an RS code object
  ParallelProcessor(rs r) : decoder(r) {};

  Read inner_decode(std::vector<u8> input) {
    // Do inner decode here
    // 1. Check for errors, 2. Parse column and chunk index. 3. Wrap into Read struct
    Read read;
    if (!decoder.decode(input)) {
      read.valid = false;
      return read;
    }
    // Last two bytes of the decoded array store the chunk index and column index
    int byte = input[decoder.data_length - 2];
    
    for (int i = 0; i < 8; i++) {
      read.chunk_index += (1 << i) * ((byte >> i) & 1);
    }

    byte = input[decoder.data_length - 1];

    for (int i = 0; i < 8; i++) {
      read.col_index += (1 << i) * ((byte >> i) & 1);
    }

    return read;
  }
};
