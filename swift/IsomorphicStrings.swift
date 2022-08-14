// https://leetcode.com/problems/isomorphic-strings/

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var smap = [Character: Character]()
        var tmap = [Character: Character]()
        for i in s.indices {
            if smap[s[i]] != nil {
                if smap[s[i]] != t[i] {
                    return false
                }
            } else {
                smap[s[i]] = t[i]
            }
            if tmap[t[i]] != nil {
                if tmap[t[i]] != s[i] {
                    return false
                }
            } else {
                tmap[t[i]] = s[i]
            }
        }
        return true
    }
}