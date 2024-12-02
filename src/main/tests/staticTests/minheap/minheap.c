
#define NULL 0
int scanf( const char *format, ... );
int printf ( const char * format, ... );
void *malloc(unsigned long size);
void free(void *);
typedef long size_t;
void *memcpy(void *dest_str, const void * src_str, size_t n);
void *realloc( void *ptr, size_t new_size );


int compareDoubles(void *left, void *right) {
    double leftVal, rightVal;

    leftVal = *(double*)left;
    rightVal = *(double*)right;

    if ((leftVal - rightVal) < 0) {
        return -1;
    } else {
        return 1;
    }
}

typedef struct {
    void **arr;
    int (*compare)(void*, void*);
    int size;
    int capacity;
} MinHeap;



void heapify(MinHeap* h, int index) {
    int left, right, min;
    void *temp;

    left = index * 2 + 1;
    right = index * 2 + 2;
    min = index;

    // Checking whether our left or child element
    // is at right index or not to avoid index error
    if (left >= h->size || left < 0)
        left = -1;
    if (right >= h->size || right < 0)
        right = -1;

    // store left or right element in min if
    // any of these is smaller that its parent
    if (left != -1) {
        if (h->compare(h->arr[left], h->arr[index]) < 0) {
            min = left;
        }
    }
    if (right != -1) {
        if (h->compare(h->arr[right], h->arr[min]) < 0) {
            min = right;
        }
    }
    // Swapping the nodes
    if (min != index) {
        temp = h->arr[min];
        h->arr[min] = h->arr[index];
        h->arr[index] = temp;

        // recursively calling for their child elements
        // to maintain min heap
        heapify(h, min);
    }
}

MinHeap* make(int capacity, void **values, int (*compareFunc)(void*, void*)) {
    int i;

    // Allocating memory to heap h
    MinHeap* h = (MinHeap*)malloc(sizeof(MinHeap));

    // Checking if memory is allocated to h or not
    if (h == NULL) {
        printf("Memory error\n");
        return NULL;
    }

    // set the values to size and capacity
    h->size = 0;
    h->capacity = capacity;
    h->compare = compareFunc;


    // Allocating memory to array
    h->arr = (void*)malloc(capacity * sizeof(void*));

    // Checking if memory is allocated to h or not
    if (h->arr == NULL) {
        printf("Memory error\n");
        return NULL;
    }

    for (i = 0; i < capacity; i+=1) {
        h->arr[i] = values[i];
    }


    h->size = i;
    i = (h->size - 2) / 2;
    while (i >= 0) {
        heapify(h, i);
        i-=1;
    }
    return h;
}


void *popFirst(MinHeap *h) {
    void *result;

    // Checking if the heap is empty or not
    if (h->size == 0) {
        return NULL;
    }

    // Store the node in deleteItem that
    // is to be deleted.
    result = h->arr[0];

    // Replace the deleted node with the last node
    h->arr[0] = h->arr[h->size - 1];
    // Decrement the size of heap
    h->size-=1;

    // Call minheapify_top_down for 0th index
    // to maintain the heap property
    heapify(h, 0);
    return result;
}



int main(void) {
    int i;
    MinHeap *heap;
    double *result;
    void *valuePtrs[9];
    double values[9] = {
        0.5, 3.2, 4.2, 1.5, 3.2, 9.0, 0.1, 3.0, 7.5
    };

    for (i = 0; i < 9; i+=1) {
        valuePtrs[i] = &values[i];
    }

    heap = make(9, valuePtrs, compareDoubles);

    while ((result = (double*)popFirst(heap)) != NULL) {
        printf("%ld\n", *(long*)result);
    }


    return 0;
}