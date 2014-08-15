#include <stdio.h>
#include <math.h>

int f(int x)
{
    return x * x;
}

int g(int (*func)(int), int x)
{
    return (*func)(x + 1) + (*func)(x - 1);
}

int main()
{
    printf("%d\n", g(f, 5));
    if(1)
      printf("test\n");

    return 0;
}
