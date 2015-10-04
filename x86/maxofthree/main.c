#include <stdio.h>
#include <inttypes.h>

int64_t maxofthree(int64_t x, int64_t y, int64_t z);

int main()
{
	printf("%ld\n",maxofthree(1,2,3));
	printf("%ld\n",maxofthree(-1,2,-3));
	printf("%ld\n",maxofthree(1,-2,3));
	printf("%ld\n",maxofthree(1,2,6));
	printf("%ld\n",maxofthree(9,20,53));
	return 0;
}
