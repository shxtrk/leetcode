// https://leetcode.com/problems/sort-array-by-parity/

int* sortArrayByParity(int* nums, int numsSize, int* returnSize){
    for (int i = 0, j = 0; i < numsSize; i++) {
        int temp;
        if (nums[i] % 2 == 0 && nums[j] % 2 != 0) {
            temp = nums[i];
            nums[i] = nums[j];
            nums[j++] = temp;
        } else if (nums[i] % 2 == 0 && nums[j] % 2 == 0) {
            j++;
        }
    }
    *returnSize = numsSize;
    return nums;
}