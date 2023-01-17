// https://leetcode.com/problems/flip-string-to-monotone-increasing/

class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        let s = Array(s)
        var answer = 0
        var numberOf1s = 0

        for i in stride(from: 0, to: s.count, by: 1) {
            if s[i] == "0" {
                answer = min(numberOf1s, answer + 1)
            } else {
                numberOf1s += 1
            }
        }
        
        return answer
    }
}