
int printf(char *s, ...);
int getchar();

int fib(int n) {
    if (n <= 1) {
        return 0;
    } else if (n == 2) {
        return 1;
    } else {
        return fib(n-1) + fib(n-2);
    }
}

int main() {
    int n, result;

    printf("Please Provide a Number:\n");
    n = getchar() - '0';
    result = fib(n);

    printf("Fib(%d) = %d\n", n, result);

    return 0;
}