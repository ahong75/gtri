#include <omp.h>
#include "ParallelProcessor.hpp"
#include "MainProcessor.hpp"
#include "blockingconcurrentqueue.h"
#include <iostream>

using namespace std;

Read inner_decode(rs &decoder, std::vector<u8> input) {
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

int main() {
  int num_reads = 200;
  Galois::G256 field;
  rs check(3, 20, &field);
  ParallelProcessor par_proc(check);
  MainProcessor main_proc(10, 20);
  moodycamel::ConcurrentQueue<Read> read_queue;
  vector<vector<unsigned char>> data(200, vector<unsigned char>(22));
  // I have no idea what to do to solve the I/O problem
  cout << "Yes" << endl;
  atomic<int> j(0);
  atomic<int> k(0);
  #pragma omp parallel for
  for (int i = 0; i < num_reads; i++) {
    // I don't know if it's allowed to share the main_proc object across these threads.
    // The function is pushing to a thread-safe data structure, but the object itself is not thread-safe?
    main_proc.receive(inner_decode(check, data[i]));
    // main_proc.receive(par_proc.inner_decode(data[i]));
    j++;
    cout << "Parallel: " << j << endl;
    #pragma omp master
    {
      main_proc.process();
      k++;
      cout << "Master: " << k << endl;
    }
  }
}

