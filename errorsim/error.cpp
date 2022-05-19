#include <iostream>
#include <string>
#include <fstream>
#include <ctime>
#include "filegen.hpp"
#include "bases.hpp"

using namespace std;

static double err_prob[3] = {0.02, 0.02, 0.02}; // insertions / deletions / substitutions. Default probability is 0.02
static double era_error = 0.001; // erasure error. Default probability is 0.001 per line in the fasta file

// Maybe include static variables that represent trackers for what errors have occured thus far
static int insertions = 0;
static int deletions = 0;
static int substitution = 0;

// Generates or does not generate an ids error based on the probabilities in err_prob
int create_ids_error() {
    double r = double(rand()) / RAND_MAX;
    double sum = 0;
    for (int i = 0; i < 3; i++) {
        sum += err_prob[i];
        if (r < sum) {
            return i;
        }
    }
    return 3;
}

// Generates or does not generate an erasure error for a line in the given fasta file based on the probability of era_error
bool create_era_error() {
    double r = double(rand()) / RAND_MAX;
    if (r < era_error) {
        return true;
    }
    return false;
}

// Takes in an input DNA string and returns a DNA string with possible insertion / deletion / substitution errors
string ids(string seq) {
    string nseq; // uses a different string as output, so it is not an in-place algorithm
    int len = seq.length();
    for (int i = 0; i < len; i++) {
        int err = create_ids_error(); // 0 -> insertion, 1 -> deletion, 2 -> substitution, 3 -> no error
        int nt = rand() % 4; // 0 -> A, 1 -> C, 2 -> T, 3 -> G
        if (bases[nt] == seq[i] && err == 2) {
            nt = (nt + (1 + rand() % 2)) % 3; // ensures that for substitutions, bases are not substituted with the same base;
        }
        if (err == 0 || err == 2) {
            nseq += bases[nt]; // for insertions or substitutions, a random base is added to the new sequence
        }
        if (err == 0 || err == 3) {
            nseq += seq[i]; // for insertions and no error, the original base is added to the sequence
        }
    }
    return nseq;
}


 
int main() {
    srand(time(NULL)); // generate a seed for the random function
    cout << "Enter in the name of the input fasta file. (Ex. \"dog.fasta\"), or press enter to use a randomly generated input file" << endl;
    string file = "input.fasta";
    if (cin.get() != '\n') {
        cin >> file;
        cin.get(); // Need this line to pick up the '\n' character 
    }
    else {
        gen(file);
    }
    cout << "Enter in 3 doubles from 0 to 1 for respective IDS error probabilites, or press enter to use default error values of 0.02: " << endl;
    if (cin.get() != '\n') {
        for (int i = 0; i < 3; i++) {
            cin >> err_prob[i];
        }
        cin.get();
    }
    cout << "Enter in 1 double from 0 to 1 for erasure error probability, or press enter to use a default value of 0.001: " << endl;
    if (cin.get() != '\n') {
        cin >> era_error;
    }
    cout << endl;
    ifstream input(file); // input stream. default parameter is ios::in
    ofstream output("output.fasta", ios::out | ios::trunc); // output stream. ios::trunc clears the file before writing to it
    string line;
    while (getline(input, line)) {
        if (!line.empty()) {
            if (line[0] == '>') { // if it's a label, just write that same label into the output fasta file
                output << line << endl;
            }
            else {
                if (create_era_error()) {
                    continue;
                }
                output << ids(line) << endl; // if the line is not erased, add possible ids errors
            }
        }
    }
    input.close(); output.close();
    cout << "A modified fasta file has been created." << endl;
}