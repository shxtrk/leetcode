// https://leetcode.com/problems/roman-to-integer/

class Solution {
    func romanToInt(_ s: String) -> Int {
        let dict: [Character: Int] = ["I": 1,
                                      "V": 5,
                                      "X": 10,
                                      "L": 50,
                                      "C": 100,
                                      "D": 500,
                                      "M": 1000]
                                      
        var result = 0
        var index = s.startIndex
        while index < s.endIndex {
            let l = dict[s[index]]!
            index = s.index(after: index)
            if index < s.endIndex, dict[s[index]]! > l {
                result += dict[s[index]]! - l
                index = s.index(after: index)
            } else {
                result += l
            }
        }
        return result
    }
}