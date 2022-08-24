# https://leetcode.com/problems/find-smallest-letter-greater-than-target/

class Solution:
    def nextGreatestLetter(self, letters: List[str], target: str) -> str:
        l, r = 0, len(letters) - 1
        while l < r:
            m = l + (r - l) // 2
            if letters[m] <= target:
                l = m + 1
            else:
                r = m
            
        return letters[l] if letters[l] > target else letters[0]