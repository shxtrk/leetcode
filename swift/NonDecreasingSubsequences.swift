// https://leetcode.com/problems/non-decreasing-subsequences/

class Solution {
    func findSubsequences(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var sequence = [Int]()

        func backtrack(from i: Int) {
            if i == nums.count {
                if sequence.count >= 2 {
                    result.insert(Array(sequence))
                }
                return
            }

            if sequence.isEmpty || sequence.last! <= nums[i] {
                sequence.append(nums[i])
                backtrack(from: i + 1)
                sequence.removeLast()
            }

            backtrack(from: i + 1)
        }
        backtrack(from: 0)
        
        return Array(result)
    }
}