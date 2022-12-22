// https://leetcode.com/problems/sum-of-distances-in-tree/

class Solution {
    func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
        guard n > 1 else { return [0] }

        var graph = [Int: Set<Int>]()
        for edge in edges {
            graph[edge[0], default: Set<Int>()].insert(edge[1]) 
            graph[edge[1], default: Set<Int>()].insert(edge[0])
        }
        
        var count = [Int](repeating: 1, count: n)
        var answer = [Int](repeating: 0, count: n)

        func dfsCount(_ current: Int = 0, _ parent: Int = -1) {
            for child in graph[current]! {
                if child != parent {
                    dfsCount(child, current)
                    count[current] = count[current] + count[child]
                    answer[current] = answer[current] + answer[child] + count[child]
                }
            }
        }

        func dfsAnswer(_ current: Int = 0, _ parent: Int = -1) {
            for child in graph[current]! {
                if child != parent {
                    answer[child] = answer[current] - count[child] + n - count[child];
                    dfsAnswer(child, current)
                }
            }
        }

        dfsCount()
        dfsAnswer()

        return answer
    }
}