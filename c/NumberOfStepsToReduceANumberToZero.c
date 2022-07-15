// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/

int numberOfSteps(int num){
    int s = 0;
    for(int i = num; i > 0; ++s) {
        if (i%2 == 0) {
            i /= 2;
        } else {
            i--;
        }
    }
    return s;
}