#pragma once

#include <string>

using namespace std;

// Randomly generates "input.fasta" fasta file with 1000 oligos
void gen(string file_name);

// Returns a completely random DNA string of length 200
string random_oligo();