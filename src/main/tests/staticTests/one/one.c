#define NULL 0
int printf (const char *format, ...);
int exit(int reason);
int isSorted(char *words[], int len, int(*compare)(void*,void*));
int compareStrings(char *a, char *b);

int main() {
    char *words[] = {"alpha", "bingo", "bango", "bongo", "caterpillar"};
    isSorted(words, 5, compareStrings);
    return 0;
}

int isSorted(char *words[], int len, int(*compare)(void*,void*)) {
    int i;
    for (i = 0; i < len - 1; i++) {
        if (compare(words[i], words[i+1]) > 0) {
            return 0;
        }
    }
    return 1;
}

int compareStrings(char *a, char *b) {
    while (*a && *b) {
        if (*a > *b) {
            return (int) (a - b);
        } else if (*a < *b) {
            return (int) (b - a);
        }
        a++;
        b++;
    }
    return 0;
}

int time();

typedef struct {
    int date;
    char *name;
} birthday_t;

typedef int glimbus;

int foo() {
    int i;
    i = 0;
    switch(i, 2, 4) {
        case 4:
            printf("");
            break;
        case 1:
            break;
    }
    return 1;
}

int main(int argc, char **argv) {
    birthday_t *my_bday;
    birthday_t *flimbo[9];
    int i[9];
    int *body;


    if (argc != 2)
        exit(-1);

    flimbo[0]->name = (*my_bday).name;

    i[0] = 0;
    i[0] = (9 + 4) * 6;

    //foo(a, b, c);

    //my_bday = (birthday_t*) malloc(sizeof(birthday_t));
    my_bday->date = time();
    my_bday->name = argv[1];

    return 0;
}