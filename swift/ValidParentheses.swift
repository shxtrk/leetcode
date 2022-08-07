// https://leetcode.com/problems/valid-parentheses/

class Solution {
    
    var array = [Character]()
    var map: [Character: Character] = [")": "(", "}": "{", "]": "["]
    var opens: Set<Character> = ["(", "{", "["]
    
    func isValid(_ s: String) -> Bool {
        for i in s {
            if opens.contains(i) {
                array.append(i)
            } else {
                if let last = array.last, let open = map[i] {
                    if last != open {
                        return false
                    } else {
                        array.removeLast()
                    }
                } else {
                    return false
                }
            }
        }
        
        return array.count == 0
    }
}