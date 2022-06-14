// #include "G256.hpp"
#include "G256log.hpp"
#include <cstdio>
#include <ctime>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <vector>

const long long N = 1e9;
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
    Galois::Elem c = a + b;
  }

  double time = double(clock() - start);

  cout << "Addition/Subtraction" << fixed << setprecision(10)
       << time / CLOCKS_PER_SEC << endl;

  start = clock();

  for (long long i = 0; i < N; i++) {
    Galois::Elem c = a * b;
  }

  time = double(clock() - start);

  cout << "Multiplication" << fixed << setprecision(10) << time / CLOCKS_PER_SEC
       << endl;

  start = clock();

  for (long long i = 0; i < N; i++) {
    Galois::Elem c = a / b;
  }

  time = double(clock() - start);

  cout << "Division" << fixed << setprecision(10) << time / CLOCKS_PER_SEC
       << endl;
}
