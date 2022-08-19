// https://leetcode.com/problems/sqrtx/

int mySqrt(int x) {
    int lg = 0, x1 = x;
    
    while (x1 > lg) {
        x1 /= 2;
        lg++;
    }
    
    while (((long)(lg + 1) * (long)(lg + 1)) <= x)
        lg++;
    
    return lg;
}