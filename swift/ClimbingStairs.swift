// https://leetcode.com/problems/climbing-stairs/

class Solution {
    var memory = [0: 0, 1: 1, 2: 2]
    
    func climbStairs(_ n: Int) -> Int {
        if let ret = memory[n] {
            return ret
        } else {
            memory[n] = climbStairs(n - 1) + climbStairs(n - 2)
            return memory[n]!
        }
    }
}