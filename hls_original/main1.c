#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void kernel(
    int sizeKernel,
    int sizeMatrix,
    int sizeResult,
    double* restrict matrix,
    double* restrict result,
    double* restrict filter
) {
    // Pure C implementation of the convolution kernel
    for (int i = 0; i < sizeResult; ++i) {
        for (int j = 0; j < sizeResult; ++j) {
            double sum = 0.0;
            for (int ki = 0; ki < sizeKernel; ++ki) {
                for (int kj = 0; kj < sizeKernel; ++kj) {
                    // Perform element-wise multiplication and accumulate
                    sum += matrix[(i + ki) * sizeMatrix + (j + kj)] * filter[ki * sizeKernel + kj];
                }
            }
            // Store the result
            result[i * sizeResult + j] = sum;
        }
    }
}

int main() {
    double *matrix;
    double *filter;
    double *result;

    int sizeMatrix = 1024;
    int sizeKernel = 4;
    int padding = 0;
    int strides = 1;

    int sizeResult = (((sizeMatrix - sizeKernel + 2 * padding) / strides) + 1);
    printf("size Result: %d\n", sizeResult);

    // Allocate memory
    matrix = (double*) malloc(sizeMatrix * sizeMatrix * sizeof(double));
    filter = (double*) malloc(sizeKernel * sizeKernel * sizeof(double));
    result = (double*) malloc(sizeResult * sizeResult * sizeof(double));

    // Initialize filter with sequential values
    double count = 0.0;
    for (int i = 0; i < sizeKernel * sizeKernel; ++i) {
        filter[i] = count;
        count += 1.0;
    }

    // Initialize matrix with 1.0
    for (int i = 0; i < sizeMatrix * sizeMatrix; ++i) {
        matrix[i] = 1.0;
    }

    // Initialize result with 0.0
    for (int i = 0; i < sizeResult * sizeResult; ++i) {
        result[i] = 0.0;
    }

    // Call the kernel function
    kernel(sizeKernel, sizeMatrix, sizeResult, matrix, result, filter);

    // Print a portion of the result matrix for verification
    for (int i = 0; i < sizeResult; ++i) {
        for (int j = 0; j < sizeResult; ++j) {
            printf("%lf ", result[i * sizeResult + j]);
        }
        printf("\n");
    }

    // Free allocated memory
    free(matrix);
    free(result);
    free(filter);

    return 0;
}
