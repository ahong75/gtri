#include "MainProcessor.hpp"
#include <omp.h>
#include <fstream>

// Chunk width should be equivalent to the size of an outer codeword
MainProcessor::MainProcessor(int num_chunks, int chunk_width) {
  // Resizing arrays to fit input parameters
  chunks.resize(num_chunks);
  received.resize(num_chunks);
  for (int i = 0; i < num_chunks; i++) {
    chunks[i].resize(chunk_width);
    received[i].resize(chunk_width);
  }
}

// Waits for the queue to be filled and processes it
void MainProcessor::process() {
  Read read;
  read_queue.wait_dequeue(read);
  if (read.valid) {
    int chunk_index = read.chunk_index;
    int col_index = read.col_index;
    // popping the chunk and column index
    read.data.pop_back();
    read.data.pop_back();
    if (received[chunk_index][col_index]) return;
    chunks[chunk_index][col_index] = read.data;
    received[chunk_index][col_index] = 1;
  }
}

// Performs an inner decode on a given FASTA file in parallel 
std::vector<std::vector<std::vector<u8>>> MainProcessor::inner_decode(std::string filename, rs &decoder) {
  ParallelProcessor par_proc(decoder);
  std::ifstream file(filename);
  // Later on, might want to consider changing I/O into buffered input when dealing
  // with larger files
  // buffer_size; vector<std::string> buffer(buffer_size);
  int line_count = 0;
  std::vector<std::string> buffer;
  std::string line;
  while (getline(file, line)) {
    // Only pushes non-label lines to the buffer. The reason why I have this conditional
    // here and not within the parallel processing is because each thread has their own
    // branch predictor, which means context is probably not shared between threads.
    // This conditional should be very predictable, it's just every other line, but
    // when parallelizing the buffer processing, it might not be every other line. 
    if (!line.empty() && line[0] != '>') {
      buffer.push_back(line);
      line_count++;
    }
  }
  file.close();
  int count = 0;
  // Creating a team of threads
  #pragma omp parallel
  {
    // One thread (the "master" thread) is assigned to act as the main processor
    // This thread dequeues from the concurrent queue and reconstructs the chunks array
    #pragma omp master
    {
      for (int i = 0; i < line_count; i++) {
        this->process();
      }
    }
    // The rest of the threads act as parallel processors and decode the lines of the file
    // in parallel
    #pragma omp for
    for (int i = 0; i < line_count; i++) {
      // This is where the DNA base class should come in
      std::vector<u8> cur_line = std::vector<u8>(line[i]);
      this->read_queue.try_enqueue(par_proc.inner_decode(cur_line));
      // Read read;
      // if (par_proc.inner_decode(cur_line, read)) {
      //   this->receive(read);
      // }
    }
  }
  return this->chunks;
}

std::vector<std::vector<int>> MainProcessor::get_erasures() {
  std::vector<std::vector<int>> erasures;
  for (int i = 0; i < received.size(); i++) {
    erasures.push_back({});
    for (int j = 0; j < received[i].size(); j++) {
      if (!received[i][j]) erasures[i].push_back(j);
    }
  }
  return erasures;
}
