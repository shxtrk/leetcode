// https://leetcode.com/problems/longest-common-subsequence/

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var memo = [[Int?]](repeating: [Int?](repeating: nil, count: text2.count), count: text1.count)
        func lcs(_ p1: String.Index, _ p2: String.Index) -> Int {
            guard p1 != text1.endIndex && p2 != text2.endIndex else { return 0 }
            if let memorized = memo[p1.encodedOffset][p2.encodedOffset] {
                return memorized
            }
            let n1 = text1.index(after: p1)
            let n2 = text2.index(after: p2)
            var ret = 0
            if text1[p1] == text2[p2] {
                ret = 1 + lcs(n1, n2)
            } else {
                ret = max(lcs(p1, n2), lcs(n1, p2))
            }
            memo[p1.encodedOffset][p2.encodedOffset] = ret
            return ret
        }
        return lcs(text1.startIndex, text2.startIndex)
    }
}