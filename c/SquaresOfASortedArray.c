// https://leetcode.com/problems/squares-of-a-sorted-array/

int copmare(const void *a, const void *b) {
    return *(int *)a - *(int *)b;
}

int* sortedSquares(int* nums, int numsSize, int* returnSize){
    int *new = (int *)malloc(numsSize * sizeof(int));
    for (int i = numsSize - 1; i >= 0; i--)
        new[i] = nums[i] * nums[i];
    
    qsort(new, numsSize, sizeof(int), copmare);
            
    *returnSize = numsSize;
    return new;
}