// https://leetcode.com/problems/evaluate-reverse-polish-notation/

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for i in stride(from: 0, to: tokens.count, by: 1) {
            
            if let integer = Int(tokens[i]) {
                stack.append(integer)
            } else {
                let right = stack.popLast()!
                let left = stack.popLast()!
                switch tokens[i] {
                case "+":
                    stack.append(left + right)
                case "-":
                    stack.append(left - right)
                case "*":
                    stack.append(left * right)
                case "/":
                    stack.append(left / right)
                default: ()
                }
            }
        }
        return stack.popLast()!
    }
}