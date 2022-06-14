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

  // Averaged over 5 trials
  double total = 0;
  for (int i = 0; i < 5; i++) {
    clock_t start = clock();
    for (long long i = 0; i < N; i++) {
      Galois::Elem c = a + b;
    }
    double time = double(clock() - start);
    total += time;
  }
  total /= 5;
  cout << "Addition/Subtraction: " << fixed << setprecision(10)
       << total / CLOCKS_PER_SEC << endl;

  // Averaged over 5 trials
  total = 0;
  for (int i = 0; i < 5; i++) {
    clock_t start = clock();
    for (long long i = 0; i < N; i++) {
      Galois::Elem c = a * b;
    }
    double time = double(clock() - start);
    total += time;
  }

  total /= 5;
  cout << "Multiplication: " << fixed << setprecision(10)
       << total / CLOCKS_PER_SEC << endl;

  // Averaged over 5 trials
  total = 0;
  for (int i = 0; i < 5; i++) {
    clock_t start = clock();
    for (long long i = 0; i < N; i++) {
      Galois::Elem c = a / b;
    }
    double time = double(clock() - start);
    total += time;
  }
  total /= 5;
  cout << "Division: " << fixed << setprecision(10) << total / CLOCKS_PER_SEC
       << endl;
}
