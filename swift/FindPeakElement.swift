// https://leetcode.com/problems/find-peak-element/

class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        
        while l < r {
            let m = l + (r - l) / 2
            if nums[m] > nums[m + 1] {
                r = m
            } else {
                l = m + 1
            }
        }
        return l
    }
}