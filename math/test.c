#include <math.h>
#include <stdio.h>
#include <stdlib.h>

double variance(double arr[], size_t n) {
  double sum = 0;
  for (size_t i = 0; i < n; ++i) {
    sum += arr[i];
  }
  double mean = sum / n;

  double variance = 0;
  for (size_t i = 0; i < n; ++i) {
    variance += pow(arr[i] - mean, 2);
  }

  return variance / n;
}

int main() {
  double arr[] = {1., 2., 3.};
  printf("%f\n", variance(arr, 3));
}
