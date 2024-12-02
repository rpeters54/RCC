
#define NULL 0
int printf(char *s, ...);

void fizzbuzz(int n) {
    short flag;
    int i = 0;
    while(i < n) {
        flag = 0;
        if (i % 3 == 0) {
            printf("Fizz");
            flag = 1;
        }
        if (i % 5 == 0) {
            printf("Buzz");
            flag = 1;
        }
        if (flag == 0) {
            printf("%d", i);
        }
        printf("\n");
        i += 1;
    }
}

int main() {
    fizzbuzz(100);
    return 0;
}