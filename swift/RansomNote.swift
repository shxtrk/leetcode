// https://leetcode.com/problems/ransom-note/

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var table = [Character: Int]()
        for c in magazine {
            table[c, default: 0] += 1
        }
        for c in ransomNote {
            table[c, default: 0] -= 1
        }
        for (i, n) in table {
            if n<0 {
                return false
            }
        }
        return true
    }
}