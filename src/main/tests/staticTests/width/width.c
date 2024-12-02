
#define NULL 0
int printf(char *s, ...);

void test_sign(int nit, unsigned int unit, long gong, unsigned long dugong) {
    if (gong >= 0) {
        printf("gong >= 0\n");
    } else {
        printf("gong < 0\n");
    }

    if (dugong >= 0) {
        printf("dugong >= 0\n");
    } else {
        printf("dugong < 0\n");
    }

    if (nit >= 0) {
        printf("nit >= 0\n");
    } else {
        printf("nit < 0\n");
    }

    if (unit >= 0) {
        printf("unit >= 0\n");
    } else {
        printf("unit < 0\n");
    }

}

int main() {
    int nit;
    unsigned int unit;
    long gong;
    unsigned long dugong;

    nit = 0xFFFFFFFF;
    unit = 0xFFFFFFFF;
    gong = 0xFFFFFFFFFFFFFFFF;
    dugong = 0xFFFFFFFFFFFFFFFF;

    test_sign(nit, unit, gong, dugong);

    nit -= 3;
    unit -= 3;
    gong -= 3;
    dugong -= 3;

    test_sign(nit, unit, gong, dugong);

    return 0;
}

