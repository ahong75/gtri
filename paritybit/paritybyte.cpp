#include <iostream>
#include <cstdlib>
#include <bitset>
#include <vector>

using namespace std;

// function that encodes a vector of bytes with a parity byte with even parity
vector<unsigned char> encode(vector<unsigned char> seq) {
    unsigned char pbyte = 0;
    for (auto c : seq) {
        pbyte ^= c;
    }
    seq.push_back(pbyte);
}

// function that computes parity of all the bytes and determines whether or not its even
pair<bool, vector<unsigned char>> decode(vector<unsigned char> seq) {
    unsigned char pbyte = 0;
    for (auto c : seq) {
        pbyte ^= c;
    }
    seq.pop_back();
    return {pbyte == 0, seq};
}

int main() {
    return 0;
}
