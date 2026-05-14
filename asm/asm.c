int max(int x, int y, int z) {
  int max;
  if (x > y) {
    max = x;
  } else {
    max = y;
  }
  if (z > max) {
    max = z;
  }
  return max;
}

float sub(float x, float y, float z) { return x - y - z; }

char mul(char x, char y, char z) { return x * y * z; }
