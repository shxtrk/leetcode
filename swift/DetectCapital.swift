// https://leetcode.com/problems/detect-capital/

class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        var index = word.startIndex

        let checkForLowercased: Bool

        if word[index].isLowercase {
            checkForLowercased = true
        } else {
            index = word.index(after: index)
            guard index != word.endIndex else { return true }
            checkForLowercased = word[index].isLowercase
            index = word.index(after: index)
        }

        while index != word.endIndex {
            if word[index].isLowercase != checkForLowercased {
                return false
            }
            index = word.index(after: index)
        }

        return true
    }
}