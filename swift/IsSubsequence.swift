// https://leetcode.com/problems/is-subsequence/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var slow = s.startIndex
        var fast = t.startIndex

        while slow < s.endIndex && fast < t.endIndex {
            if s[slow] == t[fast] {
                slow = s.index(after: slow)
            }
            fast = t.index(after: fast)
        }

        return slow == s.endIndex 
    }
}
