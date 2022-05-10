#include <stdio.h>
#include <stdlib.h>

int fibonacci(int n)
{
    if(n <= 1)
        return n;
    else
    {
        return (fibonacci(n-1) + fibonacci(n-2));
    }
}

int main()
{
    int n, i = 0;
    printf("Enter number of elements F(n): ");
    scanf("%d", &n);
    printf("\nFibonacci series: ");

    printf("%d", fibonacci(n));
/*
    for(i; i <= n; i++)
    {
        printf("%d ", fibonacci(i));
    }
    printf("\n");
    */
    return 0;
}
