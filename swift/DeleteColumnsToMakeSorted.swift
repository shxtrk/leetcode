// https://leetcode.com/problems/delete-columns-to-make-sorted/

class Solution {
    func minDeletionSize(_ strs: [String]) -> Int {
        let n = strs.count
        var index = strs[0].startIndex

        var numberOfColums = 0
        while index != strs[0].endIndex {
            var prev: Character = "a"

            for s in strs {
                if s[index] < prev {
                    numberOfColums += 1
                    break
                }
                prev = s[index]
            }
            
            index = strs[0].index(after: index)
        }

        return numberOfColums
    }
}