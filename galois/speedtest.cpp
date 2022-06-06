#include "G256.hpp"
#include <cstdio>
#include <ctime>
#include <fstream>
#include <iostream>
#include <vector>

const long long N = 1e4;
using namespace std;
int main() {
  Galois::G256 field;
  Galois::Elem a(&field, 10);
  Galois::Elem b(&field, 20);
  // warm-up run
  // for (long long i = 0; i < N; i++) {
  //   Galois::Elem c = a * b;
  // }
  clock_t start = clock();

  for (long long i = 0; i < N; i++) {
    Galois::Elem c = a * b;
  }

  float duration = float(clock() - start) / CLOCKS_PER_SEC;
  cout << 1e9 * duration / N << endl;
}
