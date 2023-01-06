// https://leetcode.com/problems/clone-graph/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

 class Solution {
    var visited = [Node: Node]()

    func cloneGraph(_ node: Node?) -> Node? {
        guard node != nil else { return nil }
        guard visited[node!] == nil else { return visited[node!] }

        visited[node!] = Node(node!.val)

        for neighbor in node!.neighbors {
            visited[node!]!.neighbors.append(cloneGraph(neighbor))
        }
        
        return visited[node!]
    }
}