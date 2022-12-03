// https://leetcode.com/problems/single-row-keyboard/

class Solution {
    func calculateTime(_ keyboard: String, _ word: String) -> Int {
        guard word.count != 0 else { return 0}

        var map = [Character: Int]()
        var index = keyboard.startIndex
        while index < keyboard.endIndex {
            map[keyboard[index]] = index.encodedOffset
            index = keyboard.index(after: index)
        }

        var result = 0
        var last = 0
        for c in word {
            result += abs(last - map[c]!)
            last = map[c]!
        }

        return result
    }
}