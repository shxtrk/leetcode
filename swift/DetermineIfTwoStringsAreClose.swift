// https://leetcode.com/problems/determine-if-two-strings-are-close/

class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        var dict1 = [Character: Int]()
        var dict2 = [Character: Int]()

        for c in word1 {
            dict1[c] = (dict1[c] ?? 0) + 1
        }

        for c in word2 {
            dict2[c] = (dict2[c] ?? 0) + 1
        }
        
        return dict1.keys == dict2.keys && dict1.values.sorted() == dict2.values.sorted()
    }
}