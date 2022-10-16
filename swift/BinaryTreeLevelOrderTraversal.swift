// https://leetcode.com/problems/binary-tree-level-order-traversal/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
 
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return [] }

        var result = [[Int]]()
        var queue = [root!]

        while !queue.isEmpty {
            var newQueue = [TreeNode]()
            var layer = [Int]()

            for (index, node) in queue.enumerated() {
                if node.left != nil {
                    newQueue.append(node.left!)
                }
                if node.right != nil {
                    newQueue.append(node.right!)
                }
                layer.append(node.val)
            }

            result.append(layer)
            queue = newQueue
        }
        
        return result
    }
}