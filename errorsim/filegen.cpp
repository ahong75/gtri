#include "filegen.hpp"
#include "bases.hpp"
#include <fstream>
#include <iostream>
#include <random>

void gen(string file_name) {
    ofstream output(file_name, ios::out | ios::trunc); // trunc clears the entire file when opening
    for (int i = 0; i < OLIGO_COUNT; i++) {
        output << ">Oligo #: " << i + 1 << endl;
        output << random_oligo() << endl;
    }
    output.close();
}

string random_oligo() {
    random_device dev;
    mt19937 rng(dev());
    uniform_int_distribution<mt19937::result_type> dist3(0, 3);
    string s;
    for (int i = 0; i < OLIGO_LEN; i++) {
        s += bases[dist3(rng)];
    }
    return s;
}