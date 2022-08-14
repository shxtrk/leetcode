// https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in stride(from: 0, to: nums.count, by: 1) {
            if dict[target - nums[i]] != nil {
                return [dict[target - nums[i]]!, i]
            }
            dict[nums[i]] = i
        }
        return []
    }
}