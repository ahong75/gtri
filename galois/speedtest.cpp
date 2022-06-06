#include "G256.hpp"
#include <cstdio>
#include <ctime>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <vector>

const long long N = 3e9;
using namespace std;
int main() {
  Galois::G256 field;
  Galois::Elem a(&field, 10);
  Galois::Elem b(&field, 20);
  // warm up run
  for (long long i = 0; i < N; i++) {
    Galois::Elem c = a * b;
  }
  clock_t start = clock();

  for (long long i = 0; i < N; i++) {
    Galois::Elem c = a * b;
  }

  cout << fixed << setprecision(10) << double(clock() - start) / CLOCKS_PER_SEC << endl;
}
