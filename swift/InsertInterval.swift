// https://leetcode.com/problems/insert-interval/

class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var newInterval = newInterval

        for i in stride(from: 0, to: intervals.count, by: 1) {
            if newInterval[0] > intervals[i][1] {
                result.append(intervals[i])
            } else if newInterval[1] < intervals[i][0] {
                result.append(newInterval)
                return result + intervals[i...(intervals.count - 1)]
            } else {
                let val1 = min(intervals[i][0], newInterval[0])
                let val2 = max(intervals[i][1], newInterval[1])
                newInterval = [val1, val2]
            }
        }

        result.append(newInterval)
        return result
    }
}