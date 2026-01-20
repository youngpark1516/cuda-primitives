cmake_minimum_required(VERSION 3.18)
project(cuda_primitives LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CUDA_STANDARD 17)

add_executable(main src/main.cu)
set_target_properties(main PROPERTIES CUDA_SEPARABLE_COMPILATION ON)