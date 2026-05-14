#include <stdio.h>

void hello() { puts("Hello"); }

void named_hello() {
  char buff[256];
  printf("Your name: ");
  fgets(buff, 256, stdin);
  printf("Hello, %s", buff);
}

int max(int x, int y) {
  if (x > y) {
    return x;
  }
  return y;
}

void load() {
  float d = 1.0;
  for (long i = 0; i < 5'000'000'000; ++i) {
    d = d + 1.;
  }
}
