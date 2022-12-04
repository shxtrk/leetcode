// https://leetcode.com/problems/minimum-average-difference/

class Solution {
    func minimumAverageDifference(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        let n = nums.count
        var leftSum = nums[0]
        var rightSum = nums.reduce(0, +) - leftSum
        var idx = 0
        var value = abs(leftSum - (rightSum / (n > 1 ? n - 1 : 1)))
        
        for i in 1..<nums.count {
            leftSum += nums[i]
            rightSum -= nums[i]
            
            let val = abs(leftSum / (i + 1) - (rightSum / (n - i - 1 > 1 ? n - i - 1 : 1)))
            if val < value {
                idx = i
                value = val
            } else if val == value, i < idx {
                idx = i
                value = val
            }
        }

        return idx
    }
}