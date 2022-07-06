#include "MainProcessor.hpp"
#include <omp.h>
#include <fstream>
#include <iostream>

// Chunk width should be equivalent to the size of an outer codeword
MainProcessor::MainProcessor(int num_chunks, int chunk_width, int inner_word_size) : 
  read_queue(num_chunks * chunk_width), inner_word_size(inner_word_size) {
  // Resizing arrays to fit input parameters
  chunks.resize(num_chunks);
  received.resize(num_chunks);
  for (int i = 0; i < num_chunks; i++) {
    chunks[i].resize(chunk_width);
    received[i].resize(chunk_width);
  }
}

// Waits for the queue to be filled and processes it
// Note: consider chaning this function so that it only waits for a certain amount of time
// This is so we don't wait infinitely for an element that was never pushed to the queue in the first place
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

bool MainProcessor::inner_encode(std::string filename, rs &encoder, std::vector<std::vector<std::vector<u8>>> &chunks) {
  // Outputting to fasta file. ios::trunc clears the file before writing to it
  std::ofstream output(filename, std::ios::out | std::ios::trunc);
  for (int i = 0; i < chunks.size(); i++) {
    for (int j = 0; j < chunks[i].size(); j++) {
      std::vector<u8> cur_line = chunks[i][j];
      // I'm assuming that the given array is already indexed
      encoder.encode(cur_line);
      // This is where the DNABase class comes in
      std::string s = cur_line;
      output << '>' << j << std::endl;
      output << s << std::endl;
    }
  }
  output.close();
  return true;
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
  // Creating a team of threads (same as the # of cores in the processor)
  // Testing: Limit # of cores and see computing time scaling
  #pragma omp parallel for
  for (int i = -1; i < line_count; i++) {
    // One thread (the "master" thread) is assigned to act as the main processor
    // This thread dequeues from the concurrent queue and reconstructs the chunks arrayt
    if (i == -1) {
      for (int j = 0; j < line_count; j++) {
        this->process();
      }
    }
    else {
      // The rest of the threads act as parallel processors and decode the lines of the file
      // in parallel
      // This is where the DNA base class should come in
      std::vector<u8> cur_line = std::vector<u8>(buffer[i]);
      // Later want to make use of the boolean this function call returns
      // Might lose line if try_enqueue fails (throw warning?)
      this->read_queue.enqueue(par_proc.inner_decode(cur_line));
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
