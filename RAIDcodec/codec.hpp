#pragma once
#include <iostream>
#include <vector>
std::vector<std::vector<unsigned char>>
outer_encode(std::vector<unsigned char> &input, int width, int height);

std::vector<std::vector<unsigned char>>
inner_encode(std::vector<std::vector<unsigned char>> &input);

void encode(std::vector<unsigned char> &input, int width, int height);

std::vector<unsigned char> decode(std::ifstream &file, int width, int height);
