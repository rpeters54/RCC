
#define NULL 0
int printf(const char *s, ...);
void *malloc(unsigned long size);

typedef struct Node Node;
struct Node {
    void *val;
    Node *next;
};

typedef struct {
    int   size;
    Node *head;
} Stack;

void *pop(Stack *s);
void push(Stack *s, void *value);
Stack *make(void);

int main(void) {
    int i, *box;
    Stack *s;

    s = make();

    for (i = 0; i < 100; i+=1) {
        box = malloc(sizeof(int));
        *box = i;
        printf("Value in the stack: %d\n", *box);
        push(s, box);
    }

    for (i = 0; i < 100; i+=1) {
        box = pop(s);
        printf("Value in the stack: %d\n", *box);
    }

    return 0;
}

void *pop(Stack *s) {
    void *result;
    if (s->size == 0) {
        return NULL;
    }

    result = s->head->val;
    s->head = s->head->next;
    s->size -= 1;
    return result;
}

void push(Stack *s, void *value) {
    Node *first = (Node*) malloc(sizeof(Node));
    if (first == NULL) {
        return;
    }

    first->val = value;
    first->next = s->head;
    s->head = first;
    s->size += 1;
}

Stack *make(void) {
    Stack *s = (Stack*) malloc(sizeof(Stack));
    if (s == NULL) {
        return NULL;
    }
    s->size = 0;
    s->head = NULL;
    return s;
}
