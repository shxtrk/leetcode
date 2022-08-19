# https://leetcode.com/problems/sqrtx/

class Solution:
    def mySqrt(self, x: int) -> int:
        if x < 2:
            return x
        
        l, r = 2, x // 2
        
        while l <= r:
            m = l + (r - l) // 2
            n = m * m
            if n > x:
                r = m - 1
            elif n < x:
                l = m + 1
            else:
                return m
        
        return r