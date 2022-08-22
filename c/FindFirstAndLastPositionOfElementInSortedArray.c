// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

int* searchRange(int* nums, int numsSize, int target, int* returnSize) {
    *returnSize = 2;
    int *result = malloc(sizeof(int) * 2);
    result[0] = result[1] = -1l;
    if (numsSize < 1) return result;
    
    int l = 0, r = numsSize - 1;
    
    while (l < r) {
        int m = l + (r - l) / 2;
        if (nums[m] < target)
            l = m + 1;
        else
            r = m;
    }
    if (nums[l] != target)
        return result;
    else
        result[0] = result[1] = l;
    
    r = numsSize - 1;
    while (l < r) {
        int m = l + (r - l) / 2;
        if (nums[m] == target)
            if (nums[m + 1] == target) {
                l = m + 1;
            } else {
                l = m;
                break;
            }
        else if (nums[m] > target)
            r = m - 1;
        else
            l = m + 1;
    }
    result[1] = l;
    
    return result;
}