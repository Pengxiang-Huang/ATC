LIBS=
OPTIONS=-I../misc 

all: test_opt

%.bc: %.c
	clang $(OPTIONS) -O1 -Xclang -disable-llvm-passes -emit-llvm -c $< -o $@
	llvm-dis $@

test_norm.bc: test.bc
	noelle-norm $^ -o $@
	llvm-dis $@

../misc/HALIDE.o: ../misc/HALIDE.c
	clang -O3 -fdeclspec -c $^ -o $@ 

test_with_metadata.bc: test_norm.bc
	noelle-meta-pdg-embed $^ -o $@
	llvm-dis $@

test_opt.bc: test_with_metadata.bc
	noelle-load -load ~/HALIDE/lib/HALIDE.so --Halide $< -o $@
	llvm-dis $@

test_opt: test_opt.bc ../misc/HALIDE.o 
	clang $(OPTIONS) $^ -o $@ 

clean:
	rm -f *.bc *.ll test_opt test_pre_prof output.prof default.* ;

.PHONY: clean
