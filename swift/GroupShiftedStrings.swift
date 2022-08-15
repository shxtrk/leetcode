// https://leetcode.com/problems/group-shifted-strings/

class Solution {
    func groupStrings(_ strings: [String]) -> [[String]] {
        var map = [String: [String]]()
        for str in strings {
            var key = ""
            for i in str.indices {
                let prevChar = key.isEmpty ? str.last! : str[str.index(before: i)]
                let prev = Int(prevChar.asciiValue!)
                let curr = Int(str[i].asciiValue!)
                key += String((prev - curr + 26) % 26)
            }
            map[key, default: [String]()].append(str)
        }
        return Array(map.values)
    }
}