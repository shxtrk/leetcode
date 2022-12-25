// https://leetcode.com/problems/longest-subsequence-with-limited-sum/

class Solution {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let sortedNums = nums.sorted()

        var maxSubsequences = [sortedNums.first!]
        for i in stride(from: 1, to: sortedNums.count, by: 1) {
            maxSubsequences.append(sortedNums[i] + maxSubsequences[i - 1])
        }
        
        func search(for x: Int, l: Int = 0, r: Int = maxSubsequences.count) -> Int {
            var last = 0
            var left = l
            var right = r

            while left < right {
                let mid = left + (right - left) / 2
                if maxSubsequences[mid] <= x {
                    last = mid + 1
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return last
        }

        var answer = [Int]()
        for q in queries {
            answer.append(search(for: q))
        }
        return answer
    }
}