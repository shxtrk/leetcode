// https://leetcode.com/problems/determine-if-string-halves-are-alike/

class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        var a = 0
        var b = 0

        var i = s.startIndex
        var j = s.index(s.startIndex, offsetBy: s.count / 2)

        var vovels = Set<Character>(["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]);
        
        while j < s.endIndex {
            if vovels.contains(s[i]) {
                a += 1
            }
            if vovels.contains(s[j]) {
                b += 1
            }

            i = s.index(after: i)
            j = s.index(after: j)
        }

        return a == b
    }
}