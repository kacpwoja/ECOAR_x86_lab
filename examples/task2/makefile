defmake: main.c func.s
	cc -m32 -c main.c
	nasm -f elf32 func.s
	cc -m32 -o task2 main.o func.o
clean:
	rm task2 *.o

PHONY:
	defmake, clean
