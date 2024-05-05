#ifndef HALIDE_H
#define HALIDE_H

#include <stdint.h>


typedef struct {
	int64_t * data; // memory base pointer
	int64_t length; // length of the square
} HALIDE_DATA ; 

typedef void * HALIDE_ALGORITHM;

typedef void * HALIDE_SCHEDULE; 

/*
 * create data, only support square 
 */
HALIDE_DATA HALIDE_new(int64_t length);

HALIDE_DATA HALIDE_new(int64_t length, int64_t init_value);

/*
 * update a single grid in the image 
 */
void HALIDE_update(HALIDE_DATA data, int64_t x, int64_t y, int64_t new_value);

/*
 * destroy the object 
 */
void HALIDE_free(HALIDE_DATA data);

/*
 * create new algorithm
 * offset_x and offset_y are symbolic applies to every grid 
 * eg. blurx := in(x - 1, y), then here offset_x = -1, and offset_y = 0
 */
HALIDE_ALGORITHM HALIDE_algorithm(int64_t offset_x, int64_t offset_y); 

/*
 * apply the reduction to the HALIDE_algorithm
 * only support 2 reductions: + or -
 * eg. blurx := in(x-1, y)  +/- in(x, y)
 */
HALIDE_ALGORITHM HALIDE_algorithm_add(HALIDE_ALGORITHM left, HALIDE_ALGORITHM right);

HALIDE_ALGORITHM HALIDE_algorithm_sub(HALIDE_ALGORITHM left, HALIDE_ALGORITHM right);

/*
 * apply the algorithm to the data, return a new object 
 * therefore, by defualt the schedule is breadth-first 
 */
HALIDE_DATA HALIDE_realize(HALIDE_DATA data, HALIDE_ALGORITHM alorithm);

////////////// TODO: schedule interface

#endif
