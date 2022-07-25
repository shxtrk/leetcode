// https://leetcode.com/problems/check-if-n-and-its-double-exist/

bool checkIfExist(int* arr, int arrSize){
    
    if(arrSize <= 1)
        return false;
    
    for(int i = 0; i < arrSize; i++)
        for(int j = i+1; j < arrSize; j++)
            if(arr[i] * 2 == arr[j] || arr[j] * 2 == arr[i])
                return true;
    
    return false;
}