#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void kernel(
    int sizeKernel,
    int sizeMatrix,
    int sizeResult,
    double* matrix,
    double* result,
    double* filter
) {
    int i, j, ki, kj;
    for (i = 0; i < sizeResult; ++i) {
        for (j = 0; j < sizeResult; ++j) {
            double sum = 0.0;
            for (ki = 0; ki < sizeKernel; ++ki) {
                for (kj = 0; kj < sizeKernel; ++kj) {
                    sum += matrix[(i + ki) * sizeMatrix + (j + kj)] * filter[ki * sizeKernel + kj];
                }
            }
            result[i * sizeResult + j] = sum;
        }
    }
}

int main() {
    double *matrix;
    double *filter;
    double *result;

    int sizeMatrix = 8;
    int sizeKernel = 3;
    int padding = 0;
    int strides = 1;

    int sizeResult = (((sizeMatrix - sizeKernel + 2 * padding) / strides) + 1);

    matrix = (double*) malloc(sizeMatrix * sizeMatrix * sizeof(double));
    filter = (double*) malloc(sizeKernel * sizeKernel * sizeof(double));
    result = (double*) malloc(sizeResult * sizeResult * sizeof(double));

    double count = 0.0;
    int i;
    for (i = 0; i < sizeKernel * sizeKernel; ++i) {
        filter[i] = count;
        count += 1.0;
    }

    for (i = 0; i < sizeMatrix * sizeMatrix; ++i) {
        matrix[i] = 1.0;
    }

    for (i = 0; i < sizeResult * sizeResult; ++i) {
        result[i] = 0.0;
    }

    kernel(sizeKernel, sizeMatrix, sizeResult, matrix, result, filter);

    free(matrix);
    free(result);
    free(filter);

    return 0;
}
