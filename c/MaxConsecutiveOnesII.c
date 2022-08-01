// https://leetcode.com/problems/max-consecutive-ones-ii/

int findMaxConsecutiveOnes(int* nums, int numsSize) {
    int i, count, flip, max;
    
    max = count = 0;
    flip = -1;
    for (i = 0 ; i < numsSize ; ++i) {
        if (nums[i]) {
            ++count;
        } else {
            if (count > max) max = count;
            count = i - flip;
            flip = i;
        }
    }
    
    return max > count ? max : count;
}