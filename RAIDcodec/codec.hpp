#pragma once
#include <iostream>
#include <vector>

void encode(std::vector<unsigned char> &input, int width, int height);

std::vector<unsigned char> decode(std::ifstream &file, int width, int height);
