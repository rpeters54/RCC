//#include <stdio.h>
//#include <stdlib.h>
#define NULL 0
int scanf( const char *format, ... );
int printf ( const char * format, ... );
void *malloc(unsigned long size);
void free(void *);
long _mini_computeFib(long _mini_input)
{
if ((_mini_input==0L))
{
return 0L;
}
else
{
if ((_mini_input<=2L))
{
return 1L;
}
else
{
return ((_mini_computeFib((_mini_input-1L))+_mini_computeFib((_mini_input-2L))));
}
}
}
long _mini_main()
{
long _mini_input;
scanf("%ld", &_mini_input);
printf("%ld\n", _mini_computeFib(_mini_input));
return 0L;
}
int main()
{
   return _mini_main();
}

