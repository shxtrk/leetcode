// https://leetcode.com/problems/house-robber/

class Solution {
    // TODO: Speed up to O(n)
    func rob(_ nums: [Int]) -> Int {
        var memo = Array<Int>(repeating: 0, count: nums.count)
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            var currMax = nums[i]
            for j in stride(from: i + 2, to: nums.count, by: 1) {
                currMax = max(currMax, nums[i] + memo[j])
            }
            memo[i] = currMax
        }
        return memo.max()!
    }
}