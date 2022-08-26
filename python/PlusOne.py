# https://leetcode.com/problems/plus-one/

class Solution:
    def plusOne(self, digits: List[int]) -> List[int]:
        lenght = len(digits)
        for i in range(lenght):
            index = lenght - 1 - i
            if digits[index] == 9:
                digits[index] = 0
            else:
                digits[index] += 1
                return digits
        return [1] + digits