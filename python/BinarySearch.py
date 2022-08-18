# https://leetcode.com/problems/binary-search/

class Solution:
    def search(self, nums: List[int], target: int) -> int:
        min, max = 0, len(nums) - 1
        while min <= max:
            mid = int(min + (max - min) / 2)
            if nums[mid] < target:
                min = mid + 1
            elif nums[mid] > target:
                max = mid - 1
            else:
                return mid
        return -1