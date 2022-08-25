# https://leetcode.com/problems/find-pivot-index/

class Solution:
    def pivotIndex(self, nums: List[int]) -> int:
        s = sum(nums)
        l = 0
        for i, n in enumerate(nums):
            if s - l == l + n:
                return i
            l += n
        return -1
            