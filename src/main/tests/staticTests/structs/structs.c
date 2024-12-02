
#define NULL 0
int printf(char *s, ...);
int getchar();

struct test {
    int a;
    float b;
    double c;
    long d;
};

typedef struct Node Node;
struct Node {
    char val;
    Node *next;
};

int main() {
    Node n[4], *temp;
    int x;

    n[0].next = &n[1];
    n[1].next = &n[2];
    n[2].next = &n[3];
    n[3].next = &n[0];

    for (x = 0; x < 4; x+=1) {
        printf("Gimme a char\n");
        n[x].val = getchar();
        printf("Got Character: %c\n", n[x].val);
    }

    temp = &n[0];
    for (x = 0; x < 10; x+=1) {
        printf("%c\n", temp->val);
        temp = temp->next;
    }

    return 0;
}