// https://leetcode.com/problems/word-pattern/

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var dict = [Character: String]()
        var wordsSet = Set<String>()
        var words = s.split(separator: " ")
        
        guard words.count == pattern.count else { return false }

        for (i, c) in pattern.enumerated() {
            if let p = dict[c] {
                if p != words[i] { return false }
            } else if wordsSet.contains(String(words[i])) {
                return false
            } else {
                dict[c] = String(words[i])
                wordsSet.insert(String(words[i]))
            }
        }

        return true
    }
}