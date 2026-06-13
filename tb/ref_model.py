#!/usr/bin/env python3
"""
Golden Reference Model for 2D Convolution
Matches the C code (main1.c) used for PandA Bambu HLS.

Algorithm:
  - Input matrix:  1024x1024, all values = 1.0
  - Kernel:        4x4, values = 0.0, 1.0, 2.0, ..., 15.0
  - Output:        1021x1021
  - Expected:      Every output pixel = sum(0..15) = 120.0
  - Return value:  0 (from C main())
"""
import numpy as np

def conv2d_reference():
    sizeMatrix = 1024
    sizeKernel = 4
    padding = 0
    strides = 1

    sizeResult = ((sizeMatrix - sizeKernel + 2 * padding) // strides) + 1
    print(f"Output size: {sizeResult} x {sizeResult}")

    # Initialize inputs (same as C code)
    matrix = np.ones((sizeMatrix, sizeMatrix), dtype=np.float64)
    kernel = np.arange(sizeKernel * sizeKernel, dtype=np.float64).reshape(sizeKernel, sizeKernel)

    print(f"\nKernel (4x4):")
    print(kernel)
    print(f"\nKernel sum = {kernel.sum()}")

    # Since all matrix values are 1.0, every output = sum of kernel = 120.0
    expected_value = kernel.sum()  # 0+1+2+...+15 = 120.0

    # Compute convolution (to verify)
    result = np.zeros((sizeResult, sizeResult), dtype=np.float64)
    # Just verify a few pixels
    for i in range(min(3, sizeResult)):
        for j in range(min(3, sizeResult)):
            s = 0.0
            for ki in range(sizeKernel):
                for kj in range(sizeKernel):
                    s += matrix[i + ki, j + kj] * kernel[ki, kj]
            result[i, j] = s

    print(f"\nExpected output value (every pixel): {expected_value}")
    print(f"Verification (first 3x3 outputs):")
    print(result[:3, :3])
    print(f"\nC main() return value: 0")
    print(f"\nFor RTL verification:")
    print(f"  - return_port should be 0x00000000 (decimal 0)")
    print(f"  - done_port should assert after computation")

if __name__ == "__main__":
    conv2d_reference()
