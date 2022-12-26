// https://leetcode.com/problems/jump-game/

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var jumpLength = 0
        for n in nums {
            if jumpLength < 0 { return false }
            jumpLength = max(n, jumpLength)
            jumpLength = jumpLength - 1
        }
        return true
    }
}