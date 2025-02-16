// https://leetcode.com/problems/majority-element/

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        var count = 0
        var majority = 0

        for i in nums {
            dict[i, default: 0] += 1
            if dict[i]! > count {
                count = dict[i]!
                majority = i
            }
        }

        return majority
    }
}
