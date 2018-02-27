source=777
CC=gcc-7
CFLAGS=-Wno-array-bounds -Wno-unused-value -Wno-pointer-sign -Wno-return-type -Wno-implicit-function-declaration -O0

all: step1 step2 step4 step5

step1: step1-readability.o main.o
	${CC}  ${CFLAGS} $^ -o $@

step2: step2-de-virtualization.o main.o
	${CC}  ${CFLAGS} $^ -o $@

step4: step4-ssa.o main.o
	${CC}  ${CFLAGS} $^ -o $@

step5: step5-circuit-minimization.o step5.o main.o
	${CC}  ${CFLAGS} $^ -o $@
