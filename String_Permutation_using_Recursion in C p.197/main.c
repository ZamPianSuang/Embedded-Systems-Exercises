

#include <stdio.h>
#include <stdlib.h>

char str[4] = "ABC";
char result[200];
char sep[2] = " ";

void strcat(char *, char *);
void swap(char *, char *);
void permute(char *, int, int);

int main()
{
    printf("Original string: %s\n", str);
    permute(str, 0, 2);
    printf("Permutated string: %s\n", result);
    printf("Original string: %s\n", str);
    //while(1);
}

// recursive permute function
void permute(char *str, int start, int end)
{
    int i;
    if(start >= end)
    {
        strcat(result, sep);
        strcat(result, str);
    } else
    {
        for(i = start; i <= end; i++)
        {
            swap(str+start, str+i);     // swap 1
            permute(str, start+1, end);
            swap(str+start, str+i);     // swap 2
        }
    }
    printf("<str>: %s\n", str);
    printf("<result>: %s\n", result);
    return;
}
// Concatenate two strings
void strcat(char *dst, char *src)
{
    while(*dst != '\0') dst++;
    while((*dst++ = *src++) != '\0');
}
// swap two characters in a string
void swap(char *x, char *y)
{
    char temp;
    temp = *x;
    *x = *y;
    *y = temp;
}
