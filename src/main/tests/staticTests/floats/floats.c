
#define NULL 0
int printf(char *s, ...);
int rand();
void srand(unsigned int seed);

int main() {
    int i;
    double da, db, dr;
    float fa, fb, fr;


    srand(0);

    printf("Trying Doubles:\n");
    for (i = 0; i < 1000; i+=1) {
        printf("Iteration %d: \n", i);
        da = (double) rand();
        db = (double) rand();
        printf("da is %ld\n", *(long*)&da);
        printf("db is %ld\n", *(long*)&db);

        dr = da + db;
        printf("Add: %ld\n", *(long*)&dr);
        dr = da - db;
        printf("Sub: %ld\n", *(long*)&dr);
        dr = da * db;
        printf("Multiply: %ld\n", *(long*)&dr);
        dr = da / db;
        printf("Divide: %ld\n", *(long*)&dr);
    }

    printf("Trying Floats:\n");
    for (i = 0; i < 1000; i+=1) {
        printf("Iteration %d: \n", i);
        fa = (float) rand();
        fb = (float) rand();

        printf("fa is %d\n", *(int*)&fa);
        printf("fb is %d\n", *(int*)&fb);

        fr = fa + fb;
        printf("Add: %d\n", *(int*)&fr);
        fr = fa - fb;
        printf("Sub: %d\n", *(int*)&fr);
        fr = fa * fb;
        printf("Multiply: %d\n", *(int*)&fr);
        fr = fa / fb;
        printf("Divide: %d\n", *(int*)&fr);
    }


    return 0;
}