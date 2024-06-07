
// basic function, no args
void nada() {}

// simple function with args
int main(int argc, char **argv) {}

// more complicated function with lots of args
char *rainbow(int red, int orange, int yellow, int green, int blue, int purple) {}

// old-style version of above
char *rainbow(red, orange, yellow, green, blue, purple)
int red, orange, yellow, green, blue, purple;
{}

// old-style version of above (again)
char *rainbow(red, orange, yellow, green, blue, purple)
int red;
int orange;
int yellow;
int green, blue, purple;
{}

struct Node *search(struct Node *root, int value) {}

union IDK *lost() {}
