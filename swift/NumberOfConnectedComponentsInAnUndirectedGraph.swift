// https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/

class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var ds = [Int]()
        (0..<n).forEach { ds.append($0) }
        var rank = [Int](repeating: 1, count: n)

        func find(_ x: Int) -> Int {
            if ds[x] != x {
                ds[x] = find(ds[x])
            }
            return ds[x]
        }

        var unconnected = n
        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)

            if rootX != rootY {
                if rank[rootX] > rank[rootY] {
                    ds[rootY] = rootX
                } else if rank[rootX] < rank[rootY] {
                    ds[rootY] = rootX
                } else {
                    ds[rootY] = rootX
                    rank[rootX] = rank[rootX] + 1
                }
                ds[rootY] = rootX
                unconnected = unconnected - 1
            }
        }

        for e in edges {
            union(e[0], e[1])
        }

        return unconnected
    }
}