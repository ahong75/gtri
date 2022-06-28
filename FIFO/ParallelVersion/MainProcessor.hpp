#pragma once
#include <queue>
#include <vector>
#include "ParallelProcessor.hpp"
#include "concurrentqueue.h"

typedef unsigned char u8;

class MainProcessor {
  public:
  // 3D vector that stores all the data that we are trying to read
  // First index -> which chunk
  // Second index -> which column in that chunk
  // Third index -> which byte in that column
  std::vector<std::vector<std::vector<u8>>> chunks;

  // 2D vector used to see if some column has already been received.
  std::vector<std::vector<bool>> received;

  // FIFO queue that stores received reads from parallel processors
  // moodycamel::BlockingConcurrentQueue<Read> read_queue;
  moodycamel::ConcurrentQueue<Read> read_queue;

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
    Read read;
    // read_queue.wait_dequeue(read);
    if (read_queue.try_dequeue(read)) {
      int chunk_index = read.chunk_index;
      int col_index = read.col_index;
      // popping the chunk and column index
      read.data.pop_back();
      read.data.pop_back();
      if (received[chunk_index][col_index]) return;
      chunks[chunk_index][col_index] = read.data;
      received[chunk_index][col_index] = 1;
    }
    read_queue.try_dequeue(read);
  }

  // Receives a read from a parallel processor and pushes it into the queue
  void receive(Read read) {
    // I'm not sure if I'm allowed to have this kind of conditional.
    // Is is better to have this in process(), or perhaps even before, should I not even send invalid reads?
    if (!read.valid) return;
    read_queue.try_enqueue(read);
  }

  std::vector<std::vector<int>> get_erasures() {
    std::vector<std::vector<int>> erasures;
    for (int i = 0; i < received.size(); i++) {
      erasures.push_back({});
      for (int j = 0; j < received[i].size(); j++) {
        if (!received[i][j]) erasures[i].push_back(j);
      }
    }
    return erasures;
  }
};
