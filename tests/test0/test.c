#include "HALIDE.h"
#include <stdio.h>

int main(){

	HALIDE_DATA d0 = HALIDE_new(5, 0);
	HALIDE_DATA d1 = HALIDE_new(5, 0);

	for (int i = 0 ; i < 5; ++i){
		for (int j = 0; j < 5; ++j ){
			HALIDE_add(d0, d1, i, j, 3);				
		}
	}
	
	for (int k = 0; k < 5; ++k){
		for (int m = 0 ; m < 5; ++m){
			HALIDE_sub(d0, d1, k, m, 2);
		}
	}

	printf("the data is: %ld \n", HALIDE_get(d1, 1, 2));

	HALIDE_free(d0);
	HALIDE_free(d1);

	return 0;
}
