// https://leetcode.com/problems/fibonacci-number/

class Solution {
    var memory = [0: 0, 1: 1]
    
    func fib(_ n: Int) -> Int {
        if let res = memory[n] {
            return res
        } else {
            memory[n] = fib(n - 1) + fib(n - 2)
            return memory[n]!
        }
    }
}