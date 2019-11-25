#include <stdio.h>

char* removerng(char* s, char a, char b);

int main(int argc, char** argv)
{
	if(argc < 4)
	{
		printf("Too few input arguments (need 3)\n");
		return 1;
	}
	if(argc > 4)
	{
		printf("Excess arguments will be ignored.\n");
	}
	printf("%s - ", argv[1]);
	printf("%s\n", removerng(argv[1], *argv[2], *argv[3]));
	
	return 0;
}
