// https://leetcode.com/problems/valid-mountain-array/

bool validMountainArray(int* arr, int arrSize){
    if (arrSize <= 2)
        return false;
    int inc = 0, dec = 0;
    for (int i = 1; i < arrSize - 1; i++) {
        if (arr[i-1] < arr[i] && arr[i] > arr[i+1])
            inc++;
        else if (arr[i-1] > arr[i] && arr[i] < arr[i+1])
            dec++;
        else if (arr[i-1] == arr[i] || arr[i] == arr[i+1])
            return false;
    }
    return inc == 1 && dec == 0;
}