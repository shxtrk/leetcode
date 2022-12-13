// https://leetcode.com/problems/minimum-falling-path-sum/

class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = matrix
        let rows = matrix.count
        let cols = matrix[0].count
        for i in 1..<rows {
            for j in 0..<cols {
                let left: Int = j > 0 ? dp[i-1][j-1] : Int.max
                let mid: Int = dp[i-1][j]
                let right: Int = j < cols - 1 ? dp[i-1][j+1] : Int.max
                dp[i][j] = min(left, mid, right) + matrix[i][j]
            }
        }
        return dp.last!.min()!
    }
}