// https://leetcode.com/problems/max-consecutive-ones-ii/

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var length = 0
        var tmpLength1 = 0
        var tmpLength2 = 0
        var currengTmpLength1 = true
        for num in nums {
            if num == 1 {
                if currengTmpLength1 {
                    tmpLength1 += 1
                } else {
                    tmpLength2 += 1
                }
            } else {
                tmpLength1 = currengTmpLength1 ? tmpLength1 + 1 : 0
                tmpLength2 = !currengTmpLength1 ? tmpLength2 + 1 : 0
                currengTmpLength1 = !currengTmpLength1
            }
            length = max(tmpLength2 + tmpLength1, length)
        }
        return length
    }
}