#include "ParallelProcessor.hpp"
#include <vector>

typedef unsigned char u8;
// Change so you pass in a read by reference. That way you don't always have to 
// return a Read struct
// Update: The reason why I still have this function returning a Read is because 
// that's the only way we can know it advance how many elements the queue expects.
// This is important because or else, we can't parallelize it efficiently,
// or at least, we will unintentionally leave some elements in the queue.
// Perhaps there is a solution to this problem, but the main issue is that there is no good
// stopping condition for the concurrent queue if we don't know how many elements there will be in it
// in advance.
Read ParallelProcessor::inner_decode(std::vector<u8> input) {
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

// bool inner_decode(std::vector<u8> input, Read &read) {
//   // Do inner decode here
//   // 1. Check for errors, 2. Parse column and chunk index. 3. Wrap into Read struct
//   if (!decoder.decode(input)) {
//     return false;
//   }
//   // Last two bytes of the decoded array store the chunk index and column index
//   int byte = input[decoder.data_length - 2];
//   
//   for (int i = 0; i < 8; i++) {
//     read.chunk_index += (1 << i) * ((byte >> i) & 1);
//   }

//   byte = input[decoder.data_length - 1];

//   for (int i = 0; i < 8; i++) {
//     read.col_index += (1 << i) * ((byte >> i) & 1);
//   }

//   return true;
// }
