#include <iostream>
#include <string>

using namespace std;

// Maybe include static variables that represent trackers for what errors have occured thus far
static int insertions = 0;
static int deletions = 0;
static int substitution = 0;

// Takes in an input binary string and returns a binary string with insertion / deletion / substitution errors
string modify(string seq) {
    string nseq; // uses a different string as output, so it is not an in-place algorithm
    int len = seq.length();
    for (int i = 0; i < len; i++) {
        int err = rand() % 3; // 0 -> insertion, 1 -> deletion, 2 -> substitution
        int nt = rand() % 4; // 0 -> A, 1 -> C, 2 -> T, 3 -> G
        switch(err) {
            case 0:
                
        }
    }
}

// Can pass in 0 or 3 parameters.
int main(int argc, char *argv[]) {
    int i = 0.01, d = 0.01, s = 0.01 // default error probability is 0.01 for each type of error
    if ()
}