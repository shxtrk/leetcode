// https://leetcode.com/problems/all-paths-from-source-lead-to-destination/

class Solution {
    private enum State {
        case notVisited
        case visiting
        case visited
    }
    
    func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var states: [State] = Array(repeating: .notVisited, count: n)
        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
        }

        func isValidPath(start: Int) -> Bool {
            switch states[start] {
            case .visited:
                return true
            case .visiting:
                return false
            case .notVisited:
                break
            }
            states[start] = .visiting
            defer { states[start] = .visited }

            if graph[start].isEmpty {
                return start == destination
            }
            for neighbor in graph[start] {
                if !isValidPath(start: neighbor) {
                    return false
                }
            }
            return true
        }

        return isValidPath(start: source)
    }
}