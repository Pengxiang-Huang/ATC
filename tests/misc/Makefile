OPTIONS=-I../misc
OPT=-O2 -lm

all: compiler_output program.ll

compiler_output: program.bc ../misc/HALIDE.o
	timeout 10m halide-c $^ 2> $@

program.bc: program.c
	clang $(OPTIONS) -O1 -fdeclspec -emit-llvm -c $<

program.ll: program.bc
	llvm-dis $^

program: program.bc ../misc/HALIDE.o
	clang $(OPTIONS) $^ -o $@

# check: compiler_output
# 	../misc/check.sh

../misc/HALIDE.o: ../misc/HALIDE.c
	clang $(OPT) -fdeclspec -c $^ -o $@

# install: program.bc program.ll
# 	cp *.bc *.ll bitcode/
#
# oracle: compiler_output
# 	mkdir -p output
# 	mv $^ output/oracle_output.txt
#
clean:
	rm -rf program program_optimized program_optimized_output *.bc *.ll a.out diff core* program_output compiler_output *.txt tmpOut;
	if test -d bitcode ; then cp bitcode/* . ; fi ;
	rm -f *sorted ;

.PHONY: run clean 

