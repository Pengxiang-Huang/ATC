#include <stdio.h>
#include <stdlib.h>
#include <string>
#include "HALIDE.h"

// typedef struct {
// 	int64_t value; 
// 	int64_t computation = 0  	; 
// } internal_data_t ;



HALIDE_DATA HALIDE_new(int64_t length){
	return HALIDE_new(length, 0);
}

HALIDE_DATA HALIDE_new(int64_t length, int64_t init_value){
	HALIDE_DATA halide_data ; 

	// allocate the memory
	halide_data.data = (int64_t *) malloc (length * length * sizeof(int64_t)); 

	if (halide_data.data == NULL) exit(EXIT_FAILURE);

	// requires length greater than 3
	if (halide_data.length < 3) exit(EXIT_FAILURE);
	
	halide_data.length = length ; 

	// init the value 
	for (int64_t j = 0; j < length * length ; ++j){
		halide_data.data[j] = init_value;
	}

	return halide_data ;
}


void HALIDE_update(HALIDE_DATA data, int64_t x, int64_t y, int64_t new_value){
	
	// avoid invalide update 
	if (x < 0 || y < 0 || x >= data.length || y >= data.length){
		return ;
	}

	// update the data value 
	data.data[x * data.length + y] = new_value;

}



void HALIDE_free(HALIDE_DATA d){
	free(d.data);
	return ;
}





