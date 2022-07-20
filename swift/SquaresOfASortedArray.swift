// https://leetcode.com/problems/squares-of-a-sorted-array/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        nums.map { $0 * $0 }.sorted()
    }
}