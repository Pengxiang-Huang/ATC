#include "HALIDE.h"
#include <stdio.h>

int main(){

	HALIDE_DATA d = HALIDE_new(5, 0);
	
	for (int i = 0 ; i < 5; ++i){
		for (int j = 0; j < 5; ++j ){
			HALIDE_update(d, i , j, 5);				
		}
	}
	
	for (int k = 0; k < 5; ++k){
		for (int m = 0 ; m < 5; ++m){
			HALIDE_update(d, k, m, 10);
		}
	}

	printf("the data is: %ld \n", HALIDE_get(d, 1, 2));

	HALIDE_free(d);

	return 0;
}
