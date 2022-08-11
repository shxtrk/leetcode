// https://leetcode.com/problems/single-number/

class Solution {
    var set = Set<Int>()
    func singleNumber(_ nums: [Int]) -> Int {
        for num in nums {
            if set.contains(num) {
                set.remove(num)
            } else {
                set.insert(num)
            }
        }
        return set.first!
    }
}