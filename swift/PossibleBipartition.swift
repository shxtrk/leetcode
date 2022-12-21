// https://leetcode.com/problems/possible-bipartition/

class Solution {
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        guard !dislikes.isEmpty else { return true }
        var aj = [Int: [Int]]()
        for dis in dislikes {
            aj[dis[0] - 1, default: [Int]()].append(dis[1] - 1)
            aj[dis[1] - 1, default: [Int]()].append(dis[0] - 1)
        }
        var ds = [Int]()
        (0..<n).forEach { ds.append($0) }
        
        func find(_ x: Int) -> Int {
            return ds[x] == x ? x : find(ds[x])
        }

        func connect(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            if rootX != rootY {
                ds[rootY] = rootX
            }
        }

        for i in 0..<n {
            if !aj.keys.contains(i) { continue }
            for nb in aj[i]! {
                if find(nb) == find(i) {
                    return false
                }
                connect(aj[i]![0], nb)
            }
        }
        return true
    }
}