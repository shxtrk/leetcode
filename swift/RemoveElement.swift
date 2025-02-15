// https://leetcode.com/problems/remove-element/

class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var k = nums.count - 1
        var p = 0

        while p <= k {
            if nums[k] == val {
                k -= 1
            } else if nums[p] == val {
                nums[p] = nums[k]
                p += 1
                k -= 1
            } else {
                p += 1
            }
        }

        return p
    }
}
