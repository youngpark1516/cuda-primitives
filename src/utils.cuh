// utils.cuh - simple CUDA helpers: error checking and timer
#pragma once
#include <cuda_runtime.h>
#include <cstdio>
#include <cstdlib>

#define CUDA_CHECK(call) do { \
    cudaError_t err = call; \
    if (err != cudaSuccess) { \
        fprintf(stderr, "CUDA error %s at %s:%d\n", cudaGetErrorString(err), __FILE__, __LINE__); \
        exit(err); \
    } \
} while(0)

struct CudaTimer {
    cudaEvent_t start{nullptr}, stop{nullptr};
    CudaTimer() { CUDA_CHECK(cudaEventCreate(&start)); CUDA_CHECK(cudaEventCreate(&stop)); }
    ~CudaTimer() { if (start) cudaEventDestroy(start); if (stop) cudaEventDestroy(stop); }
    void startEvent() { CUDA_CHECK(cudaEventRecord(start)); }
    float stopEvent() { CUDA_CHECK(cudaEventRecord(stop)); CUDA_CHECK(cudaEventSynchronize(stop)); float ms; CUDA_CHECK(cudaEventElapsedTime(&ms, start, stop)); return ms; }
};
