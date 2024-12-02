#define NULL 0

int printf(char *s, ...);

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int a,b;
    a = 9;
    b = 3;
    swap(&a, &b);
    printf("%d\n", a);
    return 0;
}