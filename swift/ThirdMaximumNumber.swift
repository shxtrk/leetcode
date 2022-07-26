// https://leetcode.com/problems/third-maximum-number/

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        var result: (Int, Int?, Int?) = (nums[0], nil, nil)

        for number in nums {
            guard number != result.0 && number != result.1 && number != result.2 else { continue }

            if number > result.0 {
                result.2 = result.1
                result.1 = result.0
                result.0 = number
                continue
            } else if number > (result.1 ?? Int.min) {
                result.2 = result.1
                result.1 = number
                continue
            } else if number > (result.2 ?? Int.min) {
                result.2 = number
                continue
            }
        }

        return result.2 ?? result.0     
    }
}