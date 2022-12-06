// https://leetcode.com/problems/valid-anagram/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dict = [Character: Int]()
        for c in s {
            dict[c, default: 0] += 1
        }
        for c in t {
            dict[c, default: 0] -= 1
        }
        for v in dict.values {
            if v != 0 {
                return false
            }
        }
        return true
    }
}