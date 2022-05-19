#pragma once

#include <string>

using namespace std;

#define OLIGO_LEN 200
#define OLIGO_COUNT 1000

// Randomly generates "file_name" fasta file with OLIGO_COUNT oligos
void gen(string file_name);

// Returns a completely random DNA string of length OLIGO_LEN
string random_oligo();