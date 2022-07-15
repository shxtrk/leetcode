// https://leetcode.com/problems/number-of-steps-to-reduce-a-number-to-zero/

class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var steps = 0
        var num = num
        while num > 0 {
            num = num % 2 == 0 ? num / 2 : num - 1
            steps += 1
        }
        return steps
    }
}