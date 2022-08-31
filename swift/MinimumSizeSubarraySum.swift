// https://leetcode.com/problems/minimum-size-subarray-sum/

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        
        var sum = 0
        var minLength = nums.count + 1
        
        var slow = 0
        for fast in stride(from: 0, to: nums.count, by: 1) {
            sum += nums[fast]
            while sum >= target {
                minLength = min(minLength, fast + 1 - slow)
                sum -= nums[slow]
                slow += 1
            }
        }
        
        return minLength != nums.count + 1 ? minLength : 0
    }
}