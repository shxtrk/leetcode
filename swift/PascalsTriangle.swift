// https://leetcode.com/problems/pascals-triangle/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in stride(from: 0, to: numRows, by: 1) {
            result.append([])
            for j in stride(from: 0, to: i + 1, by: 1) {
                if j == 0 || j == i {
                    result[i].append(1)
                } else {
                    result[i].append(result[i - 1][j - 1] + result[i - 1][j])
                }
            }
        }
        return result
    }
}