#pragma once
#include <string>
#include <vector>

std::vector<std::vector<unsigned char>>
outer_encode(std::vector<unsigned char> &input, int width, int height);

std::vector<std::vector<unsigned char>>
inner_encode(std::vector<std::vector<unsigned char>> &input, int width,
             int height);

void encode(std::vector<unsigned char> &input, int width, int height);

std::vector<unsigned char> decode(std::string filename, int width, int height);
