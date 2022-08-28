# https://leetcode.com/problems/diagonal-traverse/

class Solution:
    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        result = []
        i, j = 0, 0
        d = 1
        while i < len(mat) and j < len(mat[i]):
            result.append(mat[i][j])
            if d:
                if j == len(mat[i]) - 1:
                    i += 1
                    d = 0
                elif i == 0:
                    j += 1
                    d = 0
                else:
                    i -= 1
                    j += 1
            else:
                if i == len(mat) - 1:
                    j += 1
                    d = 1
                elif j == 0:
                    i += 1
                    d = 1
                else:
                    i += 1
                    j -= 1
        return result
        