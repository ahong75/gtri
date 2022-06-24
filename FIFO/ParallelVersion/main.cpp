#include <omp.h>
#include "ParallelProcessor.hpp"
#include "MainProcessor.hpp"

using namespace std;

int main() {
  int num_reads = 200;
  Galois::G256 field;
  rs check(3, 20, &field);
  ParallelProcessor par_proc(check);
  MainProcessor main_proc(10, 20);
  moodycamel::BlockingConcurrentQueue<Read> read_queue;
  vector<vector<unsigned char>> data(200, vector<unsigned char>(22));
  // I have no idea what to do to solve the I/O problem
  #pragma omp parallel for
  for (int i = 0; i < num_reads; i++) {
    vector<unsigned char> row = data[i];
    // I don't know if it's allowed to share the main_proc object across these threads.
    // The function is pushing to a thread-safe data structure, but the object itself is not thread-safe?
    main_proc.receive(par_proc.inner_decode(row));
    #pragma omp master
      main_proc.process();
  }

}
