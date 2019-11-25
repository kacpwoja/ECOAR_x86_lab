#include <stdio.h>
#include <stdlib.h>

char* remnth(char* s, int n);

int main(int argc, char** argv)
{
	if(argc < 3)
	{
		printf("Needs 2 input arguments - string and int\n");
		return 1;
	}
	if(argc > 3)
		printf("Excess arguments will be ignored.\n");

	printf("%s %d - ", argv[1], atoi(argv[2]));
	printf("%s\n", remnth(argv[1], atoi(argv[2])));

	return 0;
}
