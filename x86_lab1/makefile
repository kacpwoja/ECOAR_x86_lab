CC=gcc
ASMBIN=nasm

all : asm cc link
asm : 
	$(ASMBIN) -o reverse.o -f elf -l reverse.lst reverse.asm
cc :
	$(CC) -m32 -c -g -O0 lab.c
link :
	$(CC) -m32 -o kwojakowski lab.o reverse.o
clean :
	rm *.o
	rm reverse.lst
	rm kwojakowski
