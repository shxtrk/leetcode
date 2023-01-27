// https://leetcode.com/problems/concatenated-words/

class Solution {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        var words = Set<String>(words)
        func helper(_ str: [Character], _ count: Int) -> Bool {
            if count > 1 && (words.contains(String(str)) || str.isEmpty) {
                return true
            }
            var temp = [Character]()
            for (i, s) in str.enumerated() {
                temp.append(s)
                if words.contains(String(temp)) {
                    if helper(Array(str[i + 1 ..< str.count]), count + 1) {
                        return true
                    }
                }
            }
            return false
        }
        return words.filter { helper(Array($0), 0) }
    }
}