// https://leetcode.com/problems/minimum-index-sum-of-two-lists/

class Solution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var map = [String: Int]()
        for (i, s) in list2.enumerated() {
            map[s] = i
        }
        var result = [String]()
        var min = Int.max
        for (i1, s) in list1.enumerated() {
            guard let i2 = map[s] else {
                continue
            }
            if i1 + i2 < min {
                result = [s]
                min = i1 + i2
            } else if i1 + i2 == min {
                result.append(s)
            }
        }
        return result
    }
}