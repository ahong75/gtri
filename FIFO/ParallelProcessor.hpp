#include <vector> 
#include "../RS/rs.hpp"
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
  ParallelProcessor(rs r) : decoder(r) {};
  Read inner_decode(std::vector<u8> input) {
    // Do inner decode here
    // 1. Check for errors, 2. Parse column and chunk index. 3. Wrap into Read struct
    Read read;
    if (!decoder.decode(input)) {
      read.valid = false;
      return read;
    }
    // Last two bytes of the decoded array are the chunk index and column index respectively
    read.chunk_index = static_cast<int>(input[decoder.data_length - 2]);
    read.col_index = static_cast<int>(input[decoder.data_length - 1]);
    return read;
  }
};
