// https://leetcode.com/problems/maximum-sum-circular-subarray/

class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
            var curMax = 0
            var curMin = 0
            var sum = 0
            var maxSum = nums[0]
            var minSum = nums[0]
            for num in nums {
                curMax = max(curMax, 0) + num
                maxSum = max(maxSum, curMax)
                curMin = min(curMin, 0) + num
                minSum = min(minSum, curMin)
                sum += num
            }
            return sum == minSum ? maxSum : max(maxSum, sum - minSum)
    }
}