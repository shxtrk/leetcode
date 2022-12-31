// https://leetcode.com/problems/all-paths-from-source-to-target/

class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        let n = graph.count - 1

        func dfs(_ i: Int, _ currentPath: [Int]) {
            for x in graph[i] {
                var path = currentPath
                path.append(x)
                if x == n {
                    result.append(path)
                } else {
                    dfs(x, path)
                }
            }
        }

        dfs(0, [0])
        return result
    }
}