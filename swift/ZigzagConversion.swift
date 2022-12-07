// https://leetcode.com/problems/zigzag-conversion/

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var array = Array(repeating: [String](), count: numRows)
        var sign = 1
        var pointer = 0
        for c in s {
            array[pointer].append(String(c))
            pointer += sign
            if pointer == 0 {
                sign = 1
            } else if pointer == numRows - 1 {
                sign = -1
            }
        }
        return array.reduce([], +).reduce("", +)
    }
}