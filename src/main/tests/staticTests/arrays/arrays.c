
#define NULL 0

int printf(char *s, ...);
int rand();
void srand(unsigned int seed);

int main() {
    int i, val, arr[100];

    srand(0);

    for (i = 0; i < 100; i+=1) {
        val = rand();
        printf("Iteration %d: Generated Value %d\n", i, val);
        arr[i] = val;
    }

    for (i = 0; i < 100; i+=1) {
        printf("Iteration %d: Read Value %d\n", i, arr[i]);
    }

    return 0;
}