// https://leetcode.com/problems/number-of-good-paths/

class Solution {
    class DisjointSet {
        private var vals: [Int]
        private var rank: [Int]

        init(_ size: Int) {
            vals = Array(0..<size)
            rank = [Int](repeating: 0, count: size)
        }

        func find(_ x: Int) -> Int {
            if vals[x] != x {
                vals[x] = find(vals[x])
            }
            return vals[x]
        }

        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)

            if rootX != rootY {
                if rank[rootX] < rank[rootY] {
                    vals[rootX] = rootY
                } else if rank[rootX] > rank[rootY] {
                    vals[rootY] = rootX
                } else {
                    vals[rootY] = rootX
                    rank[rootX] += 1
                }
            }
        }
    }

    func numberOfGoodPaths(_ vals: [Int], _ edges: [[Int]]) -> Int {
        var adj = [Int: [Int]]()
        for e in edges {
            adj[e[0], default: [Int]()].append(e[1])
            adj[e[1], default: [Int]()].append(e[0])
        }

        var valuesToNodes = [Int: [Int]]()
        for i in 0..<vals.count {
            valuesToNodes[vals[i], default: [Int]()].append(i)
        }

        let ds = DisjointSet(vals.count)
        var goodPaths = 0
        
        let sortedKeys = Array(valuesToNodes.keys).sorted()
        for key in sortedKeys {

            for node in valuesToNodes[key]! {
                guard adj[node] != nil else { continue }

                for neighbor in adj[node]! {
                    if vals[node] >= vals[neighbor] {
                        ds.union(node, neighbor)
                    }
                }
            }

            var group = [Int: Int]()
            for u in valuesToNodes[key]! {
                group[ds.find(u)] = (group[ds.find(u)] ?? 0) + 1
            }

            for size in group.values {
                goodPaths += size * (size + 1) / 2
            }
        }

        return goodPaths
    }
}
