# Halide-c Design 

Design purpose: to demonstrate the halide scheduling using blur algorithm, and the tradeoff behind.


### Language Design Detail 

Halide::new(dim): allocate the memory and create a grid object, initialize it with all 0s.


Halide::update(dim1, dim2, value): update the value based on the location defined by two dimensions.


Halide::realize(aglorithm): apply the algoritm on all points in the grid


Halide::split(dim, num) : split the dimension by the tile number


 


### Code Transformation
the code transformation pass will perform the scheduling based on the given schedule,
if not given schedule, it will perform the default schedule, which will update the producer before any consumer



