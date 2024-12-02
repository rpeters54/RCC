// structs and unions

struct {
    char name;
    int game;
} goated;


struct truck {
    unsigned int arr[100];
    void *(*malloc)(int size);
    int (*compare)(char *a, char *b);
};

union constitution {
    struct {
        long long man;
        char *name;
    };
    unsigned char **fooba;
};