// https://leetcode.com/problems/fizz-buzz/

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var answer = [String]()
        for i in 1...n {
            var str = ""
            if i%3 == 0 {
                str.append("Fizz")
            }
            if i%5 == 0 {
                str.append("Buzz")
            }
            if str.isEmpty {
                str.append("\(i)")
            }
            answer.append(str)
        }
        return answer
    }
}