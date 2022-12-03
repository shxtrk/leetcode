// https://leetcode.com/problems/sort-characters-by-frequency/

class Solution {
    func frequencySort(_ s: String) -> String {
        var dict = [Character: Int]()
        for c in s {
            dict[c, default: 0] += 1
        }
        let arr = dict.sorted(by: { $0.value > $1.value})
        var str = ""
        for v in arr {
            for c in 0..<v.value {
                str.append(v.key)
            }
        }
        return str
    }
}