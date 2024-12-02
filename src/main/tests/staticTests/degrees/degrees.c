
#define NULL 0

int printf(char *s, ...);
int scanf( const char *format, ... );

double convertToCelsius(double fahrenheit) {
    printf("Turning %f Fahrenheit to Celsius\n", fahrenheit);
    return 5.0 / 9.0 * (fahrenheit - 32);
}

double convertToFahrenheit(double celsius) {
    printf("Turning %f Celsius to Fahrenheit\n", celsius);
    return 9.0 / 5.0 * celsius + 32;
}

int main() {
    char selector;
    double temp, result;

    printf("Select Conversion Mode:\n");
    printf("(c/C for Celsius to Fahrenheit)\n");
    printf("(f/F for Fahrenheit to Celsius)\n");
    scanf("%c\n", &selector);
    printf("Gimme the Temp\n");
    scanf("%lf\n", &temp);


    if (selector == 'c' || selector == 'C') {
        result = convertToFahrenheit(temp);
    } else if (selector == 'f' || selector == 'F') {
        result = convertToCelsius(temp);
    } else {
        result = 0;
        printf("Invalid Selection\n");
    }

    printf("Current Temp = %f degrees\n", result);
    return 0;
}