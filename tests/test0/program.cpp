#include <iostream>
#include "HALIDE.h"

int main(){

	auto d = HALIDE_new(5, 8);
	auto algo0 = HALIDE_algorithm(-1, 0);
	auto algo1 = HALIDE_algorithm(0, 0);
	auto algo3 = HALIDE_algorithm(1, 0);

	auto algo4 = HALIDE_algorithm_add(algo0, algo1);
	auto algo5 = HALIDE_algorithm_add(algo3, algo4);

	auto newd = HALIDE_realize(d, algo5);

	int64_t result = HALIDE_get(newd, 3, 4);


	std::cout << result << std::endl;



	return 0;
}
