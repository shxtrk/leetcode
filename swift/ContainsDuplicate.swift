// https://leetcode.com/problems/contains-duplicate/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        Set(nums).count < nums.count
    }
}