// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/

int* findDisappearedNumbers(int* nums, int numsSize, int* returnSize){
    int all[numsSize];
    for (int i = 0; i < numsSize; i++)
        all[i] = i + 1;
    
    int count = numsSize;
    for (int i = 0; i < numsSize; i++)
        if (all[nums[i] - 1] != 0) {
            all[nums[i] - 1] = 0;
            count--;
        }
    
    int *result = (int *) malloc(sizeof(int) * count);
    for (int i = 0, j = 0; i < numsSize; i++)
        if (all[i] != 0)
            result[j++] = all[i];
    
    *returnSize = count;
    return result;
}