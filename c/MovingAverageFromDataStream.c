// https://leetcode.com/problems/moving-average-from-data-stream/

typedef struct {
    int *array;
    int capacity, size, headIndex;
    double sum;
} MovingAverage;

MovingAverage* movingAverageCreate(int size) {
    MovingAverage *obj = (MovingAverage *)malloc(sizeof(MovingAverage));
    obj->array = (int *)malloc(sizeof(int) * size);
    obj->capacity = size;
    obj->size = 0;
    obj->headIndex = -1;
    obj->sum = 0.0;
    return obj;
}

double movingAverageNext(MovingAverage* obj, int val) {
    obj->headIndex = (obj->headIndex + 1) % obj->capacity;
    if (obj->size >= obj->capacity) {
        obj->sum -= obj->array[obj->headIndex];
    }
    obj->sum += obj->array[obj->headIndex] = val;
    obj->size++;
    return obj->sum / (obj->size > obj->capacity ? obj->capacity : obj->size);
}

void movingAverageFree(MovingAverage* obj) {
    free(obj->array);
    free(obj);
}