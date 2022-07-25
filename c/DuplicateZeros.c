// https://leetcode.com/problems/duplicate-zeros/

void duplicateZeros(int* arr, int arrSize){
    int count = 0, skipLast = 0;
    for (int i = 0; i < arrSize - count; i++)
        if (arr[i] == 0) {
            if (i == arrSize - 1 - count) {
                arr[arrSize - 1] = 0;
                skipLast = 1;
                break;
            }
            count++;
        }
    
    for (int i = arrSize - count - 1 - skipLast; i >= 0; i--) {
        if (arr[i] == 0) {
            arr[i + count--] = 0;
            arr[i + count] = 0;
        } else {
            arr[i + count] = arr[i];
        }
    }
}
