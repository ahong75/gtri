#include <queue>
#include <vector>
#include "ParallelProcessor.hpp"

typedef unsigned char u8;

class MainProcessor {
  // 3D vector that stores all the data that we are trying to read
  // First index -> which chunk
  // Second index -> which column in that chunk
  // Third index -> which byte in that column
  static std::vector<std::vector<std::vector<u8>>> chunks;

  // 2D vector used to see if some column has already been received.
  static std::vector<std::vector<bool>> received;

  // FIFO queue that stores received reads from parallel processors
  std::queue<Read> read_queue;

  // Chunk width should be equivalent to the size of an outer codeword
  MainProcessor(int num_chunks, int chunk_width) {
    // Resizing arrays to fit input parameters
    chunks.resize(num_chunks);
    received.resize(num_chunks);
    for (int i = 0; i < num_chunks; i++) {
      chunks[i].resize(chunk_width);
      received[i].resize(chunk_width);
    }
  }

  // Processes the front element of read_queue if it contains at least 1 element
  void process() {
    if (!read_queue.empty()) {
      Read read = read_queue.front();
      read_queue.pop();
      int chunk_index = read.chunk_index;
      int col_index = read.col_index;
      // Popping the chunk and column index
      read.data.pop_back();
      read.data.pop_back();
      if (received[chunk_index][col_index]) return;
      chunks[chunk_index][col_index] = read.data;
      received[chunk_index][col_index] = 1;
    }
  }

  // Receives a read from a parallel processor and pushes it into the queue
  void receive(Read read) {
    // I'm not sure if I'm allowed to have this kind of conditional.
    // Is is better to have this in process(), or perhaps even before, should I not even send invalid reads?
    if (!read.valid) return;
    read_queue.push(read);
  }
};
