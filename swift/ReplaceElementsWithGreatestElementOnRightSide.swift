// https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/

class Solution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        var arr = arr
        var buff = -1
        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            if arr[i] > buff {
                (arr[i], buff) = (buff, arr[i]) // Swap arr[i] and buff
            } else {
                arr[i] = buff
            }
        }
        return arr
    }
}