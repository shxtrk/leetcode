// https://leetcode.com/problems/first-unique-character-in-a-string/

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dict = [Character: Int]()
        for c in s {
            if dict[c] != nil {
                dict[c] = dict[c]! + 1
            } else {
                dict[c] = 1
            }
        }
        for (i, c) in s.enumerated() {
            if dict[c] == 1 {
                return i
            }
        }
        return -1
    }
}