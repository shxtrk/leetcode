// https://leetcode.com/problems/move-zeroes/

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        nums = nums.sorted { $0 != 0 && $1 == 0 }
    }
}