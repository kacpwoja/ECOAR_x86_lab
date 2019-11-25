// Kacper Wojakowski 293064
//
// If arguments are provided to the program, it will
// use them as strings to test the function.
// Otherwise, a hard-coded string will be used
#include <stdio.h>

char* reverse(char* str);

int main(int argc, char** argv)
{
	if(argc > 1)
	{
		int i;
		for(i=1; i<argc; i++)
		{
			printf("Input: %s\n", argv[i]);
			printf("Output: %s\n\n", reverse(argv[i]));
		}
		return 0;
	}

	char test1[] = "abcdef ABCDEF 12abC32dXa []-0q91AZ1P*&";
	char test2[] = "69 SPIHS TEM on REBOTCO 21 1805.";
	char* out1 = NULL;
	char* out2 = NULL;

	printf("Input: %s\n", test1);
	out1 = reverse(test1);
	printf("Output: %s\n\n", out1);

	printf("Input: %s\n", test2);
	out2 = reverse(test2);
	printf("Output: %s\n\n", out2);

	return 0;
}
