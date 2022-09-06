// https://leetcode.com/problems/daily-temperatures/

class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var max = 0
        
        for i in stride(from: temperatures.count - 1, to: -1, by: -1) {
            let current = temperatures[i]
            if current >= max {
                max = current
                continue
            }
            
            var days = 1
            while temperatures[i + days] <= current {
                days += result[i + days]
            }
            result[i] = days            
        }
        
        return result
    }
}