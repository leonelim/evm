#include <bits/time.h>
#include <complex.h>
#include <stdio.h>
#include <time.h>
#define N 100000

complex double mod(complex double d);
int main() {
  complex double d[N];
  for (int i = 0; i < N; ++i) {
    d[i] = 3. + 4. * I;
  }
  struct timespec start, end;
  clock_gettime(CLOCK_MONOTONIC, &start);
  for (int i = 0; i < N; ++i) {
    complex double res = mod(d[i]);
    printf("√(%f^2 + (%fi)^2) = ", creal(d[i]), cimag(d[i]));
    printf("%f + %fi\n", creal(res), cimag(res));
  }
  clock_gettime(CLOCK_MONOTONIC, &end);
  printf("%f\n", (double)(end.tv_sec - start.tv_sec) +
                     (end.tv_nsec - start.tv_nsec) * 1e-9);
}
