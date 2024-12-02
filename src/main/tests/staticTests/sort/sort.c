
#define NULL 0
int rand();
int printf(char *s, ...);
void selection_sort(int *arr, int len);

int main() {
    int i;

    // init the array
    int arr[250];
    for (i = 0; i < 250; i+=1) {
        arr[i] = rand();
    }

    // run selection sort
    selection_sort((int*)arr, 250);

    // print the elements in order
    for (i = 0; i < 250; i+=1) {
        printf("%d\n", arr[i]);
    }

    return 0;
}

void selection_sort(int *arr, int len) {
    int min_index, temp, i;

    if (len <= 1) {
        return;
    }

    min_index = 0;
    for (i = 0; i < len; i+=1) {
        if (arr[i] < arr[min_index]) {
            min_index = i;
        }
    }

    temp = arr[0];
    arr[0] = arr[min_index];
    arr[min_index] = temp;

    selection_sort(arr+1, len-1);
}