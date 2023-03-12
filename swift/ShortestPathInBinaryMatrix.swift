// https://leetcode.com/problems/shortest-path-in-binary-matrix/

class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        guard grid[0][0] != 1 else { return -1 }
        guard grid.count > 1 else { return grid[0][0] == 0 ? 1 : -1 }

        let n = grid.count
        let target = [n-1, n-1]
        var queue = [[0, 0]]
        var visited = Set<[Int]>()

        func adj(x: Int, y: Int) -> Set<[Int]> {
            var ret = Set<[Int]>()
            for i in x-1...x+1 where i >= 0 && i < n  {
                for j in y-1...y+1 where j >= 0 && j < n {
                    if !(i == x && j == y)
                       && grid[i][j] != 1
                       && !visited.contains([i, j])
                    { ret.insert([i, j]) }
                }
            }
            return ret
        }

        func bfs(_ depth: Int) -> Int {
            guard !queue.isEmpty else { return -1 }
            var newQueue = Set<[Int]>()
            for p in queue {
                visited.insert(p)
                let adj = adj(x: p[0], y: p[1])
                if adj.contains(target) { return depth + 1 }
                newQueue.formUnion(adj)
            }
            queue.removeAll()
            queue.append(contentsOf: newQueue)
            return bfs(depth + 1)
        }

        return bfs(1)
    }
}