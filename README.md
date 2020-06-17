 
# How to run 

## Compile shaders

glslangValidator -V shader.frag

glslangValidator -V shader.vert

## Compile program

g++ -std=c++17 15_hello_triangle.cpp -lvulkan -lglfw

mangohud ./a.out

