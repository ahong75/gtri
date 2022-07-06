#include <omp.h>
#include "ParallelProcessor.hpp"
#include "MainProcessor.hpp"
#include "blockingconcurrentqueue.h"
#include <iostream>

using namespace std;


int main() {
  Galois::G256 field;
  rs check(3, 20, &field);
  MainProcessor main_proc(10, 20);
  vector<vector<vector<unsigned char>>> chunks = main_proc.inner_decode("encoded.fasta", check);
  // for (int i = 0; i < chunks.size(); i++) {
  //   for (int j = 0; j < chunks[i].size(); j++) {
  //     for (int k = 0; k < chunks[i][j].size(); k++) {
  //       cout << +chunks[i][j][k] << " ";
  //     }
  //     cout << endl;
  //   }
  //   cout << endl;
  // }
  // cout << endl;
  // moodycamel::ConcurrentQueue<Read> read_queue;
  // vector<vector<unsigned char>> data(200, vector<unsigned char>(22));
  // // I have no idea what to do to solve the I/O problem
  // cout << "Yes" << endl;
  // atomic<int> j(0);
  // atomic<int> k(0);
  // #pragma omp parallel for
  // for (int i = 0; i < num_reads; i++) {
  //   #pragma omp master
  //   {
  //     main_proc.process();
  //     k++;
  //     cout << "Master: " << k << endl;
  //   }
  //   // I don't know if it's allowed to share the main_proc object across these threads.
  //   // The function is pushing to a thread-safe data structure, but the object itself is not thread-safe?
  //   main_proc.receive(inner_decode(check, data[i]));
  //   // main_proc.receive(par_proc.inner_decode(data[i]));
  //   j++;
  //   cout << "Parallel: " << j << endl;
  // }
}

