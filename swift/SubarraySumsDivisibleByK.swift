// https://leetcode.com/problems/subarray-sums-divisible-by-k/

class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var prefixSum = 0
        var map: [Int: Int] = [0: 1]

        for num in nums {
            prefixSum = (prefixSum + num) % k
            if prefixSum < 0 {
                prefixSum += k
            }

            if let value = map[prefixSum] {
                count += value
            }
            
            map[prefixSum, default: 0] += 1
        }

        return count
    }
}