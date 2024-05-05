#include "HALIDE.h"
#include <iostream>
#include <assert.h>

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
	halide_data.data = new int64_t[length * length];

	if (halide_data.data == nullptr ) exit(EXIT_FAILURE);

	// requires length greater than 3
	if (halide_data.length < 3) exit(EXIT_FAILURE);
	
	halide_data.length = length ; 

	// init the value 
	for (int64_t j = 0; j < length * length ; ++j){
		halide_data.data[j] = init_value;
	}

	return halide_data ;
}


int64_t HALIDE_get(HALIDE_DATA data, int64_t x, int64_t y){
	if (x < 0 || y < 0 || x >= data.length || y >= data.length){
		std::cerr << "invalide get \n";
		std::abort();
	}

	return data.data[x * data.length + y]; 
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
	delete[] d.data;
	return ;
}


HALIDE_ALGORITHM HALIDE_algorithm(int64_t offset_x, int64_t offset_y){
	HALIDE_ALGORITHM algo ; 


	algo.offset_x.push_back(offset_x);
	algo.offset_y.push_back(offset_y);

	return algo;
}


HALIDE_ALGORITHM HALIDE_algorithm_add(HALIDE_ALGORITHM left, HALIDE_ALGORITHM right){
	/*
	 * combine left and right and yield a new algorithm 
	 */
	HALIDE_ALGORITHM algo ; 

	for (auto i : left.offset_x ){
		algo.offset_x.push_back(i);
	}

	for (auto j : right.offset_x){
		algo.offset_x.push_back(j);
	}

	for (auto m : left.offset_y){
		algo.offset_y.push_back(m);
	}
	
	for (auto n : right.offset_y){
		algo.offset_y.push_back(n);
	}

	assert(algo.offset_x.size() == algo.offset_y.size());

	return algo ;
}



HALIDE_DATA HALIDE_realize(HALIDE_DATA data, HALIDE_ALGORITHM algorithm){

	HALIDE_DATA result = HALIDE_new(data.length); 
	
	for (int64_t i = 0; i < data.length ; ++i){
		for (int64_t j = 0 ; j < data.length ; ++j){
			/*
			 * update the value 
			 */
			
			int64_t new_value = 0;

			for (int64_t k = 0 ; k < algorithm.offset_x.size(); ++k){
				int64_t offsetx = algorithm.offset_x[k];
				int64_t offsety= algorithm.offset_y[k];

				int64_t x = i + offsetx ; 
				int64_t y = j + offsety ;

				if (x < 0 || y < 0 || x >= data.length || y >= data.length) continue; 

				new_value += HALIDE_get(data, x, y); 
			}
	
			HALIDE_update(result, i , j , new_value);
		}
	}

	return result; 
}



