#include "stm32f446xx.h"
#include "stdint.h"

int main(void)
{
	uint32_t x = 0xAAAAAAAA;
	uint32_t y, z;
	
	uint32_t counter = x >> 31; 		// get MSB
	
	while(x > 0)
	{
		y = x << 2;
		z = y >> 31;									// get MSB
		if(x<<1 > y)									// check Carry bit of x
			counter = counter + z + 1;
		else
			counter = counter + z;
		x = y;
	}
	while(1);
}
