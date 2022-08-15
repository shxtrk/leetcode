// https://leetcode.com/problems/group-anagrams/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        for str in strs {
            let sorted = String(str.sorted())
            if map[sorted] == nil {
                map[sorted] = [str]
            } else {
                map[sorted]!.append(str)
            }
        }
        return Array(map.values)
    }
}