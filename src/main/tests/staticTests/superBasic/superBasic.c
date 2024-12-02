
#define NULL 0
int printf(char *s, ...);
int getchar();

int main() {
    int a, b, c;
    float fa, fb;
    int **ptr;
    char *str;

    printf("Hello World!\n");
    c = getchar();

    if (c > 'a') {
        printf("Greater Than\n");
    } else {
        printf("Less Than Or Equal To\n");
    }

    ptr = 0;
    ptr += 10;
    fa = 9.9f;
    fb = 10.0;
    a = 9;
    fa = fa + fb + a;
    b = a * 10;
    b /= 20;
    c = b * (a + 20);
    c *= 2;

    return 0;
}