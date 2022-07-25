// https://leetcode.com/problems/check-if-n-and-its-double-exist/

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        guard arr.count > 1 else { return false }
        for (i, n) in arr.enumerated() {
            for (j, m) in arr.enumerated() {
                if i == j {
                    continue
                }
                if n*2 == m {
                    return true
                }
            }
        }
        return false
    }
}