// https://leetcode.com/problems/find-closest-node-to-given-two-nodes

class Solution {
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        
        var layer1 = [Int](repeating: -1, count: edges.count)
        var layer2 = [Int](repeating: -1, count: edges.count)

        func bfs(_ n: Int, _ layer: inout [Int]) {
            var currentLayer = 0
            var next = n
            while next != -1 && layer[next] == -1 {
                layer[next] = currentLayer
                currentLayer += 1
                next = edges[next]
            }
        }
        bfs(node1, &layer1)
        bfs(node2, &layer2)
        
        var ans = -1
        var distance = Int.max
        for i in 0 ..< edges.count {
            if layer1[i] != -1 && layer2[i] != -1 && max(layer1[i], layer2[i]) < distance {
                ans = i
                distance = max(layer1[i], layer2[i])
            }
        }
        
        return ans
    }
}