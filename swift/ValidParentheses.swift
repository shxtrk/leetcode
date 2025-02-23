// https://leetcode.com/problems/valid-parentheses/

class Solution {
    let hash: [Character: Character] = [
        "(" : ")",
        "[" : "]",
        "{" : "}"
    ]

    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        for c in s {
            if c == "(" || c == "[" || c == "{" {
                stack.append(c)
            } else if stack.isEmpty || hash[stack.removeLast()] != c {
                return false
            }
        }

        return stack.isEmpty
    }
}
