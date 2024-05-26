#ifndef HALIDE_H
#define HALIDE_H

#include <stdint.h>

typedef struct {
	int64_t * data; // memory base pointer
	int64_t length; // length of the square
} HALIDE_DATA ; 


/*
 * create data, only support square 
 */
HALIDE_DATA HALIDE_new(int64_t length, int64_t init_value);

int64_t HALIDE_get(HALIDE_DATA, int64_t x , int64_t y); 

/*
 * update a single grid in the image 
 */
void HALIDE_update(HALIDE_DATA data, int64_t x, int64_t y, int64_t new_value);

/*
 * add an offset to a single grid 
 */
void HALIDE_add(HALIDE_DATA src, HALIDE_DATA dst, int64_t x, int64_t y, int64_t offset) ;


/*
 * subtract an offset to a single grid 
 */
void HALIDE_sub(HALIDE_DATA src, HALIDE_DATA dst, int64_t x, int64_t y, int64_t offset) ;

/*
 * destroy the object 
 */
void HALIDE_free(HALIDE_DATA data);


#endif
