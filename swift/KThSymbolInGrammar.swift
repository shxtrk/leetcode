// https://leetcode.com/problems/k-th-symbol-in-grammar/

class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        if n == 1 {
            return 0
        }
        return (~k & 1) ^ kthGrammar(n - 1, (k + 1) / 2)
    }
}