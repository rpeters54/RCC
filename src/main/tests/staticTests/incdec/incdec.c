
int printf(const char *s, ...);

int main() {
    long l;
    int i;
    short s;
    char c;

    float f;
    double d;

    l = i = s = c = 'f';
    f = d = 4.0;

    printf("before post-inc: %ld\n", l++);
    printf("after post-inc: %ld\n", l);
    printf("before post-dec: %ld\n", l--);
    printf("after post-dec: %ld\n", l);
    printf("before pre-inc: %ld\n", ++l);
    printf("after pre-inc: %ld\n", l);
    printf("before pre-dec: %ld\n", --l);
    printf("after pre-dec: %ld\n", l);

    printf("before post-inc: %d\n", i++);
    printf("after post-inc: %d\n", i);
    printf("before post-dec: %d\n", i--);
    printf("after post-dec: %d\n", i);
    printf("before pre-inc: %d\n", ++i);
    printf("after pre-inc: %d\n", i);
    printf("before pre-dec: %d\n", --i);
    printf("after pre-dec: %d\n", i);

    printf("before post-inc: %d\n", s++);
    printf("after post-inc: %d\n", s);
    printf("before post-dec: %d\n", s--);
    printf("after post-dec: %d\n", s);
    printf("before pre-inc: %d\n", ++s);
    printf("after pre-inc: %d\n", s);
    printf("before pre-dec: %d\n", --s);
    printf("after pre-dec: %d\n", s);

    printf("before post-inc: %c\n", c++);
    printf("after post-inc: %c\n", c);
    printf("before post-dec: %c\n", c--);
    printf("after post-dec: %c\n", c);
    printf("before pre-inc: %c\n", ++c);
    printf("after pre-inc: %c\n", c);
    printf("before pre-dec: %c\n", --c);
    printf("after pre-dec: %c\n", c);

    printf("before post-inc: %f\n", f++);
    printf("after post-inc: %f\n", f);
    printf("before post-dec: %f\n", f--);
    printf("after post-dec: %f\n", f);
    printf("before pre-inc: %f\n", ++f);
    printf("after pre-inc: %f\n", f);
    printf("before pre-dec: %f\n", --f);
    printf("after pre-dec: %f\n", f);

    printf("before post-inc: %f\n", d++);
    printf("after post-inc: %f\n", d);
    printf("before post-dec: %f\n", d--);
    printf("after post-dec: %f\n", d);
    printf("before pre-inc: %f\n", ++d);
    printf("after pre-inc: %f\n", d);
    printf("before pre-dec: %f\n", --d);
    printf("after pre-dec: %f\n", d);

    return 0;
}