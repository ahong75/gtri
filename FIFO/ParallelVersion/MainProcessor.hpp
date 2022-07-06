#pragma once
#include <vector>
#include "ParallelProcessor.hpp"
#include "blockingconcurrentqueue.h"

typedef unsigned char u8;

class MainProcessor {
  public:
  int inner_word_size;
  // 3D vector that stores all the data that we are trying to read
  // First index -> which chunk
  // Second index -> which column in that chunk
  // Third index -> which byte in that column
  std::vector<std::vector<std::vector<u8>>> chunks;

  // 2D vector used to see if some column has already been received.
  std::vector<std::vector<bool>> received;

  // FIFO queue that stores received reads from parallel processors
  // moodycamel::BlockingConcurrentQueue<Read> read_queue;
  moodycamel::BlockingConcurrentQueue<Read> read_queue;

  // Chunk width should be equivalent to the size of an outer codeword
  MainProcessor(int num_chunks, int chunk_width, int inner_word_size);

  // Waits for the queue to be filled with an element and processes it
  void process();

  // Performs an inner encode on a given chunks vector
  bool inner_encode(std::string filename, rs &encoder, std::vector<std::vector<std::vector<u8>>> &chunks);

  // Performs an inner decode on a given FASTA file in parallel
  std::vector<std::vector<std::vector<u8>>> inner_decode(std::string filename, rs &decoder);

  // Returns a vector of erasure lists corresponding to each chunk
  std::vector<std::vector<int>> get_erasures();
};
