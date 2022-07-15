// https://leetcode.com/problems/running-sum-of-1d-array/

int* runningSum(int* nums, int numsSize, int* returnSize){
    int *returnNums = (int*)malloc(numsSize * sizeof(int));
    returnNums[0] = nums[0];
    
    for (int i = 1; i < numsSize; ++i) {
        returnNums[i] = returnNums[i - 1] + nums[i];
    }
    
    *returnSize = numsSize;
    return returnNums;
}