

#define NULL 0
int printf(char *s, ...);
int rand();
void srand(unsigned int seed);
void *malloc(unsigned long size);


typedef union {
    int i;
    long l;
    float f;
    double d;
    struct {
        int a;
        int b;
    } s;
}  Everything;


int main() {
    Everything *e;
    e = malloc(sizeof(Everything));

    srand(0);

    (e->s).a = rand();
    (e->s).b = rand();

    printf("%d\n", e->i);
    printf("%ld\n", e->l);
    printf("%f\n", e->f);
    printf("%f\n", e->d);
    printf("%d\n", (e->s).a);
    printf("%d\n", (e->s).b);

    return 0;
}