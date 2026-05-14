#include "dll.h"
#include <stdio.h>
#include <time.h>

int main() {
  struct timespec start, end;
  clock_gettime(CLOCK_MONOTONIC, &start);
  hello();
  int a = 2, b = 5;
  printf("%d, %d, max: %d\n", a, b, max(a, b));
  load();
  clock_gettime(CLOCK_MONOTONIC, &end);
  printf("%f\n", (double)end.tv_sec - start.tv_sec);
}
