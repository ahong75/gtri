#pragma once
#include <string>
#include <vector>

std::vector<std::vector<unsigned char>>
file_system(std::vector<unsigned char> &input, int width, int height);

void outer_encode(std::vector<std::vector<unsigned char>> &input, int width,
                  int height);

void inner_encode(std::vector<std::vector<unsigned char>> &input, int width,
                  int height);

void encode(std::vector<unsigned char> &input, int width, int height);

bool inner_decode(std::vector<unsigned char> &input, int width);

bool outer_decode(std::vector<std::vector<unsigned char>> &input,
                  std::vector<int> &errors, int width, int height);

std::vector<unsigned char>
decode_file_system(std::vector<std::vector<unsigned char>> &input, int width,
                   int height);

std::vector<unsigned char> decode(std::string filename, int width, int height);
