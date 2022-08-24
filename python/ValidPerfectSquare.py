# https://leetcode.com/problems/valid-perfect-square/

class Solution:
    def isPerfectSquare(self, num: int) -> bool:
        l, r = 0, num
        while l <= r:
            m = l + (r - l) // 2
            if m * m == num:
                return True
            elif m * m > num:
                r = m - 1
            else:
                l = m + 1
        return False