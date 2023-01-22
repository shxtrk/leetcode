// https://leetcode.com/problems/palindrome-partitioning/

class Solution {
    func partition(_ s: String) -> [[String]] {
        var s = Array(s)
        var result = [[String]]()
        
        func backtracking(_ index: Int, _ arr: [String]) {
            if index == s.count {
                result.append(arr)
                return
            }

            var str = ""
            for i in index ..< s.count {
                str += "\(s[i])"
                if str == String(str.reversed()) {
                    backtracking(i + 1, arr + [str])
                }
            }
        }

        backtracking(0, [])
        return result
    }
}