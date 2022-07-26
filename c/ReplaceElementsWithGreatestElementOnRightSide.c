// https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/

int* replaceElements(int* arr, int arrSize, int* returnSize) {
    int tmp = -1, swap;
    for (int i = arrSize - 1; i >= 0; i--)
        if (tmp < arr[i]) {
            swap = arr[i];
            arr[i] = tmp;
            tmp = swap;
        } else
            arr[i] = tmp;
    *returnSize = arrSize;
    return arr;
}