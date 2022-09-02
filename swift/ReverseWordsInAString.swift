// https://leetcode.com/problems/reverse-words-in-a-string/

class Solution {
    func reverseWords(_ s: String) -> String {
        var arr = String(s.reversed()).components(separatedBy: " ")
        arr = arr.filter() { !$0.isEmpty }
        arr = arr.map { String($0.reversed()) }
        return arr.joined(separator: " ")
    }
}