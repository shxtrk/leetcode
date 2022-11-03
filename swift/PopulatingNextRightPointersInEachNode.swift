// https://leetcode.com/problems/populating-next-right-pointers-in-each-node/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue = [root]

        while !queue.isEmpty {
            var newQueue = [Node]()
            for i in stride(from: 0, to: queue.count, by: 1) {
                if i != queue.count - 1 {
                    queue[i].next = queue[i + 1]
                } else {
                    queue[i].next = nil
                }
                if (queue[i].left != nil) {
                    newQueue.append(queue[i].left!)
                    newQueue.append(queue[i].right!)
                }
            }
            queue = newQueue
        }
        return root
    }
}