source=777
CC=gcc-7
CFLAGS=-Wno-array-bounds -Wno-unused-value -Wno-pointer-sign -Wno-return-type -Wno-implicit-function-declaration -O0
.PHONY: all clean

all: step1-readability step2-de-virtualization step3-simplification step4-ssa step5-circuit-minimization

step1-readability: step1-readability.o main.o
step2-de-virtualization: step2-de-virtualization.o main.o
step3-simplification: step3-simplification.o main.o
step4-ssa: step4-ssa.o main.o
step5-circuit-minimization: step5-circuit-minimization.o step5.o main.o

clean:
	rm *.o
	rm step1-readability step2-de-virtualization step3-simplification step4-ssa step5-circuit-minimization
