// https://leetcode.com/problems/length-of-last-word/

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var index = s.index(before: s.endIndex)
        while s[index] == " " {
            index = s.index(before: index)
        }

        var length = 0

        while index >= s.startIndex && s[index] != " " {
            length += 1
            if index != s.startIndex {
                index = s.index(before: index)
            } else { break }
        }

        return length
    }
}
