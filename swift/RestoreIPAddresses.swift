// https://leetcode.com/problems/restore-ip-addresses/

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        
        var result = [String]()

        func restore(index: String.Index, level: Int, prev: String) {

            guard level < 3 else {
                let suffix = s.suffix(from: index)
                guard suffix.count > 0 && suffix.count <= 3 else { return }

                guard Int(suffix)! <= 255 else { return }

                if suffix.count == 1 {
                    result.append(prev + suffix)
                } else if s[index] != "0" {
                    result.append(prev + suffix)
                }

                return
            }

            var index = index
            var curr = ""
            for i in 0..<3 {
                guard index < s.endIndex else { return }

                curr += String(s[index])
                guard Int(curr)! >= 0 && Int(curr)! <= 255 else { return }
                if curr.count > 1 && curr.first! == "0" { return }

                index = s.index(after: index)
                restore(index: index, level: level + 1, prev: prev + curr + ".")
            }
        }

        restore(index: s.startIndex, level: 0, prev: "")
        
        return result
    }
}