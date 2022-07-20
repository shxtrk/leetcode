// https://leetcode.com/problems/find-numbers-with-even-number-of-digits/

class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        return nums.filter { String($0).count % 2 == 0 }.count
    }
}