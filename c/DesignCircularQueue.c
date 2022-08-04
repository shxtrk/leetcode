// https://leetcode.com/problems/design-circular-queue/

typedef struct {
    int *arr;
    int capacity, size;
    int head, tail;
} MyCircularQueue;

MyCircularQueue* myCircularQueueCreate(int k) {
    MyCircularQueue* queue = malloc(sizeof(MyCircularQueue));
    queue->arr = (int *)malloc(sizeof(int) * k);
    queue->capacity = k;
    queue->size = 0;
    queue->head = 0;
    queue->tail = -1;
    return queue;
}

bool myCircularQueueEnQueue(MyCircularQueue* obj, int value) {
    if (obj->size < obj->capacity) {
        if (obj->tail + 1 == obj->capacity)
            obj->arr[obj->tail = 0] = value;
        else
            obj->arr[++obj->tail] = value;
        obj->size++;
        return true;
    }
    return false;
}

bool myCircularQueueDeQueue(MyCircularQueue* obj) {
    if (obj->size > 0) {
        if (obj->size == 1) {
            obj->head = 0;
            obj->tail = -1;
        } else if (obj->head + 1 > obj->capacity)
            obj->head = 0;
        else
            obj->head++;
        obj->size--;
        return true;
    }
    return false;
}

int myCircularQueueFront(MyCircularQueue* obj) {
    return obj->size > 0 ? obj->arr[obj->head] : -1;
}

int myCircularQueueRear(MyCircularQueue* obj) {
    return obj->size > 0 ? obj->arr[obj->tail] : -1;
}

bool myCircularQueueIsEmpty(MyCircularQueue* obj) {
    return obj->size == 0;
}

bool myCircularQueueIsFull(MyCircularQueue* obj) {
    return obj->size == obj->capacity;
}

void myCircularQueueFree(MyCircularQueue* obj) {
    free(obj->arr);
    free(obj);
}