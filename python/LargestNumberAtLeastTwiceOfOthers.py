# https://leetcode.com/problems/largest-number-at-least-twice-of-others/

class Solution:
    def dominantIndex(self, nums: List[int]) -> int:
        first, second = 0, 0
        maxindex = 0
        for i, num in enumerate(nums):
            if num > first:
                second = first
                first = num
                maxindex = i
            elif num > second:
                second = num
        return maxindex if second * 2 <= first else -1
            