// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var all = Set<Int>()
        for i in 1...nums.count {
            all.insert(i)
        }
        all.subtract(nums)
        return Array(all)
    }
}