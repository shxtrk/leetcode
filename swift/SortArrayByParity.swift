// https://leetcode.com/problems/sort-array-by-parity/

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums
        var lastEven = 0 
        for i in 0 ..< nums.count {
            if nums[i] % 2 == 0 {
                nums.swapAt(i, lastEven)
                lastEven += 1
            }
        }
        return nums
    }
}