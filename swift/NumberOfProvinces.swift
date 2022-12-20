// https://leetcode.com/problems/number-of-provinces/

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var ds = [Int]()
        let size = isConnected.count
        (0..<size).forEach { ds.append($0) }

        func find(_ i: Int) -> Int {
            return ds[i] == i ? i : find(ds[i])
        }

        var count = size
        func connect(_ i: Int, _ j: Int) {
            let ip = find(i)
            let jp = find(j)
            if ip != jp {
                ds[jp] = ip
                count = count - 1
            }
        }
        
        for i in stride(from: 0, to: size, by: 1) {
            for j in stride(from: 0, to: size, by: 1) {
                if isConnected[i][j] == 1 {
                    connect(i, j)
                }
            }
        }
        
        return count
    }
}