#include <iostream>
#include <cstdlib>
using namespace std;

// function that encodes a binary string with an even parity bit
unsigned int encode(unsigned int b) {
    unsigned int pbit = 0;
    for (int i = 0; i < 32; i++) {
        pbit ^= (b >> i) & 1;
    }
    return (b << 1) + pbit;
}

// function that computes overall parity and based on the result determines if binary string is valid
pair<bool, unsigned int> decode(unsigned int b) {
    unsigned int pbit = 0;
    for (int i = 0; i < 32; i++) {
        pbit ^= (b >> i) & 1;
    }
    return {pbit == 0, b >> 1};
}

int main() {
    for (int i = 0; i < 100; i++) {
        cout << "Test #: " << i + 1 << endl;
        unsigned int test = rand() % 100;
        cout << "Test String: " << test << endl;
        unsigned int encoded = encode(test);
        cout << "Encoded String: " << encoded << endl;
        cout << "Parity Bit: " << (encoded & 1) << endl;
        pair<bool, unsigned int> decoded = decode(encoded);
        cout << "Valid String: ";
        if (decoded.first) {
            cout << "True" << endl;
        }
        else {
            cout << "False" << endl;
        }
        cout << "Decoded String: " << decoded.second << endl;
        }
        cout << '\n';
    }
