// https://leetcode.com/problems/graph-valid-tree/

class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var graph = [Int: Set<Int>]()

        for e in edges {
            graph[e[0], default: Set<Int>()].insert(e[1])
            graph[e[1], default: Set<Int>()].insert(e[0])
        }

        var visited = [Int](repeating: 0, count: n)
        
        var isValid = true
        func dfs(_ node: Int, _ parent: Int) {
            guard visited[node] != 1 else { 
                isValid = false
                return
            }
            visited[node] = 1
            guard let graphNode = graph[node] else { return }
            for child in graphNode {
                if child != parent {
                    dfs(child, node)
                }
            }
        }
        dfs(0, -1)
        return isValid && !visited.contains(0)
    }
}