// https://leetcode.com/problems/wiggle-sort/

class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var i = 0
        var isAscending = true
        while i < nums.count - 1 {
            if isAscending {
                if nums[i] > nums[i + 1] {
                    nums.swapAt(i, i + 1)
                }
            } else {
                if nums[i] < nums[i + 1] {
                    nums.swapAt(i, i + 1)
                }
            }
            isAscending = !isAscending
            i = i + 1
        }
    }
}