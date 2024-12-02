#define NULL 0
int printf(char *s, ...);

int main() {
    int i = 0;

    printf("Testing While Loop\n");
    while (i < 100) {
        printf("%d\n", i);
        i += 1;
    }

    printf("Testing For Loop\n");
    for (i = 0; i < 100; i+=1) {
        printf("%d\n", i);
    }

    printf("Testing Do-Loop Auto Entry\n");
    do {
        printf("Got Here Anyway\n");
    } while (i < 100);

    printf("Testing Proper Do-Loop Entry\n");
    i = 0;
    do {
        printf("%d\n", i);
        if (i == 33) {
            printf("Broke\n");
            break;
        }
        i += 1;
    } while (i < 100);

    return 0;
}