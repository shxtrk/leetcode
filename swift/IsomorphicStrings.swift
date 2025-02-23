// https://leetcode.com/problems/isomorphic-strings/

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var first = [Character: Character]()
        var second = [Character: Character]()

        var index = s.startIndex
        while index < s.endIndex {
            if let tChar = first[s[index]], tChar != t[index] {
                return false
            }
            if let sChar = second[t[index]], sChar != s[index] {
                return false
            }
            first[s[index]] = t[index]
            second[t[index]] = s[index]
            index = s.index(after: index)
        }

        return true
    }
}
