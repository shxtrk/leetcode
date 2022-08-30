// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

class Solution {
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        var l = 0
        var r = numbers.count - 1
        
        while l < r {
            if numbers[l] + numbers[r] < target {
                l += 1
            } else if numbers[l] + numbers[r] > target {
                r -= 1
            } else {
                return [l + 1, r + 1]
            }
        }
        
        return [-1, -1]
    }
}