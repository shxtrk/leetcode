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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }

        var stack: [TreeNode] = [root!]
        var result = [Int]()

        while !stack.isEmpty {
            var current = stack.removeLast()
            result.append(current.val)

            if current.right != nil {
                stack.append(current.right!)
            }

            if current.left != nil {
                stack.append(current.left!)
            }
        }

        return result
    }
}