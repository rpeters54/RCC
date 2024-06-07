int printf (const char *format, ...);
int exit(int reason);
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