#include <stdio.h>

typedef struct dow dow;
struct dow {
    int date;
    char *name;
}


/* Hello World Test Program */
int main() {
    dow tuesday;
    printf("Hello World!\n");
    return 0;
}