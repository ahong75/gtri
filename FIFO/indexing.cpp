#include <vector>
typedef unsigned char u8;
void indexing(std::vector<std::vector<std::vector<u8>>> &chunks) {
  int num_chunks = chunks.size();
  for (int i = 0; i < num_chunks; i++) {
    int chunk_width = chunks[i].size();
    for (int j = 0; j < chunk_width; j++) {
      // i = chunk_index, j = col_index
      chunks[i][j].push_back(static_cast<u8>(i));
      chunks[i][j].push_back(static_cast<u8>(j));
    }
  }
}
