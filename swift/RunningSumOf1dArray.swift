// https://leetcode.com/problems/running-sum-of-1d-array/

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        for (i, num) in nums.enumerated() {
            if i > 0 {
                result.append(num + result[i - 1])
            } else {
                result.append(num)
            }
        }
        return result
    }
}