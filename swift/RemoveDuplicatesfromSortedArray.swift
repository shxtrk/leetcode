// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        var pointer = 0
        for i in 1..<nums.count{
            if nums[pointer] != nums[i]{
                pointer += 1
                nums[pointer] = nums[i]
            }
        }
        return pointer + 1
    }
}