#pragma once
#include <string>
#include <vector>

void encode(std::vector<unsigned char> &input, int width, int height);

std::vector<unsigned char> decode(std::string, int width, int height);
