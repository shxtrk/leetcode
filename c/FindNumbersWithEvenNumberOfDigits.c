// https://leetcode.com/problems/find-numbers-with-even-number-of-digits/

int digits(int x) {
    if (x >= 10) 
        return digits(x / 10) + 1;
    else
        return 1;
}

int findNumbers(int* nums, int numsSize){
    int c = 0;
    for (int i = 0; i < numsSize; i++)
        if (digits(nums[i]) % 2 == 0)
            c++;
    return c;
}