#include <stdio.h>
#include <stdlib.h>
#include "HALIDE.h"


int main (){
  printf("Start Testing\n");

	for (int i = 0; i < 5; ++i){
		for (int j = 0; j < 5; ++j){
			// do a 
			printf("doing A\n");
		}
	}

	for (int m = 0; m < 5; ++m){
		for (int k =0; k < 5; ++k){
			// do b
			printf("doing B\n");
		}
	}

  return 0;
}
