// https://leetcode.com/problems/find-if-path-exists-in-graph/

class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        guard source != destination else { return true }

        var V = [Int: Set<Int>]()
        for e in edges {
            V[e[0], default:Set<Int>()].insert(e[1])
            V[e[1], default:Set<Int>()].insert(e[0])
        }

        var visited = Set<Int>()

        func search(_ v: Int) -> Bool {
            if V[v]!.contains(destination) { return true }
            visited.insert(v)

            for vn in V[v]! where !visited.contains(vn) {
                if search(vn) {
                    return true
                }
            }

            return false
        }

        return search(source)
    }
}