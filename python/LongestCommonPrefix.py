# https://leetcode.com/problems/longest-common-prefix/

class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        prefix = strs[0]
        for s in strs:
            count = 0
            for i in range(min(len(prefix), len(s))):
                if s[i] != prefix[i]:
                    break
                else:
                    count += 1
            prefix = prefix[0:count]
        return prefix