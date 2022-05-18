#include <iostream>
#include <string>
#include <fstream>

using namespace std;

static char bases[4] = {'A', 'T', 'G', 'C'};
static double err_prob[3] = {0.02, 0.02, 0.02}; // insertions / deletions / substitutions. Default probability is 0.02
static double era_error = 0.001;

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

// Returns a completely random DNA string of length 200
string random_string() {
    string s;
    for (int i = 0; i < 200; i++) {
        s += bases[rand() % 4];
    }
    return s;
}
 
// Can pass in 0 or 3 parameters as doubles from 0 to 1 for error probabilities (other than the program name)
int main() {
    cout << "Enter in the name of the input fasta file. Ex. for \"dog.fasta\" enter in \"dog\"" << endl;
    string file;
    if (cin.get() != '\n') {
        cin >> file;
    }
    cout << "Enter in 3 doubles from 0 to 1 for IDS error probabilites, or press enter to use default error values of 0.02: ";
    if (cin.get() != '\n') {
        for (int i = 0; i < 2; i++) {
            cin >> err_prob[i];
        }
    }
    cout << endl;
    cout << "Enter in 1 double from 0 to 1 for erasure error probability, or press enter to use a default value of 0.001";
    if (cin.get() != '\n') {
        cin >> era_error;
    }
    cout << endl;

    ifstream input(argv[1]); // input stream. default parameter is ios::in
    ofstream output("output.fasta"); // output stream. default parameter is ios::out
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