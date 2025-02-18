// https://leetcode.com/problems/ransom-note/

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        magazine.forEach {
            dict[$0, default: 0] += 1
        }
        for i in ransomNote {
            if let count = dict[i], count > 0 {
                dict[i] = count - 1
            } else {
                return false
            }
        }
        return true
    }
}
