// https://leetcode.com/problems/longest-path-with-different-adjacent-characters/

class Solution {
    func longestPath(_ parent: [Int], _ s: String) -> Int {

        let s = Array(s)
        var tree = [Int: [Int]]()
        var longest = 1
        
        for (n, p) in parent.enumerated() {
            tree[p, default: [Int]()].append(n)
        }

        func dfs(_ n: Int) -> Int {
            guard let children = tree[n] else {
                return 1
            }

            var longestSubpath = 0
            var secondLongestSubpath = 0
            for child in children {
                let childLongestSubpath = dfs(child)
                guard s[child] != s[n] else {
                    continue
                }

                if childLongestSubpath > longestSubpath {
                    secondLongestSubpath = longestSubpath
                    longestSubpath = childLongestSubpath
                } else if childLongestSubpath > secondLongestSubpath {
                    secondLongestSubpath = childLongestSubpath
                }
            }

            longest = max(longest, longestSubpath + secondLongestSubpath + 1)
            return longestSubpath + 1
        }
        dfs(0)

        return longest
    }
}