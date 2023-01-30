// https://leetcode.com/problems/n-th-tribonacci-number/

class Solution {
    var dp = [0: 0, 1: 1, 2: 1]
    func tribonacci(_ n: Int) -> Int {
        if dp[n] == nil {
            dp[n] = tribonacci(n - 1) + tribonacci(n - 2) + tribonacci(n - 3)
        } 
        return dp[n]!
    }
}