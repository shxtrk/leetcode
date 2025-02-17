// https://leetcode.com/problems/valid-palindrome/

class Solution {
    private func isAlphanumeric(_ c: Character) -> Bool {
        return c.isNumber || c.isLetter
    }

    func isPalindrome(_ s: String) -> Bool {
        var left = s.startIndex
        var right = s.index(before: s.endIndex)

        while left < right {
            if !isAlphanumeric(s[left]) {
                left = s.index(after: left)
            } else if !isAlphanumeric(s[right]) {
                right = s.index(before: right)
            } else {
                if s[left].lowercased() != s[right].lowercased() {
                    return false
                }
                left = s.index(after: left)
                right = s.index(before: right)
            }
        }
        return true
    }
}
