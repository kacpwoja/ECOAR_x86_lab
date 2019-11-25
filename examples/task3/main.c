#include <stdio.h>

unsigned int getdec(char* s);

int main(int argc, char** argv)
{
	for(int i=1; i<argc; i++)
		printf("%s - %d\n", argv[i], getdec(argv[i]));
	return 0;
}
