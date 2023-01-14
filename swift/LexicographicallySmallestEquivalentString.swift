// https://leetcode.com/problems/lexicographically-smallest-equivalent-string/

class Solution {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        
        var charSet = [Character: Int]()
        var idxSet = [Int: Character]()
        for (i, c) in "abcdefghijklmnopqrstuvwxyz".enumerated() {
            charSet[c] = i
            idxSet[i] = c
        }
        
        let s1 = Array(s1)
        let s2 = Array(s2)

        var ds = (0..<charSet.count).map { $0 }

        func connect(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)

            guard rootX != rootY else { return }

            if (rootX < rootY) {
                ds[rootY] = rootX;
            } else {
                ds[rootX] = rootY;
            }
        }

        func find(_ x: Int) -> Int {
            if ds[x] != x {
                ds[x] = find(ds[x])
                return ds[x]
            } 
            return x
        }

        for i in 0..<s1.count {
            connect(charSet[s1[i]]!, charSet[s2[i]]!)
        }

        let baseStr = Array(baseStr)
        var result = [Character]()
        for i in 0..<baseStr.count {
            result.append(idxSet[find(charSet[baseStr[i]]!)]!)
        }

        return String(result)
    }
}