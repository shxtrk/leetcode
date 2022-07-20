// https://leetcode.com/problems/max-consecutive-ones/

int findMaxConsecutiveOnes(int* nums, int numsSize){
    int c = 0, m = 0;
    for (int i = 0; i < numsSize; i++) {
        if (nums[i] == 1)
            c++;
        else
            c = 0;
        if (c > m)
            m = c;
    }
    return m;
}