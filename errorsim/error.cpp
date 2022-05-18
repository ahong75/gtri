#include <iostream>
#include <string>

using namespace std;

static char bases[4] = {'A', 'T', 'G', 'C'};
static double err_prob[3] = {0.02, 0.02, 0.02}; // insertions / deletions / substitutions. Default probability is 0.02

// Maybe include static variables that represent trackers for what errors have occured thus far
static int insertions = 0;
static int deletions = 0;
static int substitution = 0;

// Generates or does not generate an error based on the probabilities in err_prob
int create_error() {
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

// Takes in an input DNA string and returns a DNA string with insertion / deletion / substitution errors
string modify(string seq) {
    string nseq; // uses a different string as output, so it is not an in-place algorithm
    int len = seq.length();
    for (int i = 0; i < len; i++) {
        int err = create_error(); // 0 -> insertion, 1 -> deletion, 2 -> substitution, 3 -> no error
        int nt = rand() % 4; // 0 -> A, 1 -> C, 2 -> T, 3 -> G
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
    cout << "Enter in 3 doubles from 0 to 1 for IDS error probabilites, or press enter to use default error values of 0.01: ";
    if (cin.get() != '\n') {
        for (int i = 0; i < 2; i++) {
            cin >> err_prob[i];
        }
    }
    cout << endl;
    for (int i = 0; i < 100; i++) {
        string s = random_string();
        cout << "Original String: " << s << endl;
        string modified = modify(s);
        cout << "String with Error: " << modified << endl;
        cout << '\n';
    }
}