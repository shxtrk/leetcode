// https://leetcode.com/problems/max-consecutive-ones/

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var curr = 0
        var max = 0
        for n in nums {
            if n == 1 {
                curr += 1
            } else {
                curr = 0
            }
            if curr > max {
                max = curr
            }
        }
        return max
    }
}