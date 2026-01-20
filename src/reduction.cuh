#ifndef REDUCTION_CUH
#define REDUCTION_CUH

#include <cstddef>

inline float cpu_reduce_sum(const float* x, int n) {
    float sum = 0.0f;
    for (int i = 0; i < n; ++i) {
        sum += x[i];
    }
    return sum;
}

#endif