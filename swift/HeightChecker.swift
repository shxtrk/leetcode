// https://leetcode.com/problems/height-checker/

class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        var count = 0
        let expected = heights.sorted { $0 < $1 }
        for i in stride(from: 0, to: heights.count, by: 1) {
            if heights[i] != expected[i] {
                count += 1
            }
        }
        return count;
    }
}