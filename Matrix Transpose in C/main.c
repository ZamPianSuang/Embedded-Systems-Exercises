#include "stm32f4xx.h"
#include "stdint.h"

int a[3][3] = {{1,2,3},
							 {4,5,6},
							 {7,8,9}};

void transpose(int *p);
							 
int main(void)
{
	int *p = &a[3][3];
	transpose(p);
	while(1);
}

void transpose(int *p)
{
	int i, j, t;
	for(i = 0; i < 3; i++)
	{
		for(j = i+1; j < 3; j++)
		{
			t = *(p + 3*i + j);
			*(p + 3*i + j) = *(p + 3*j + i);
			*(p + 3*j + i) = t;
		}
	}
}
