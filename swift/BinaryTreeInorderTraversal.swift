// https://leetcode.com/problems/binary-tree-inorder-traversal/

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
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var stack = [TreeNode]()
        var result = [Int]()

        var curr = root

        while !stack.isEmpty || curr != nil {
            while curr != nil {
                stack.append(curr!)
                curr = curr?.left
            }
            curr = stack.removeLast()
            result.append(curr!.val)
            curr = curr?.right
        }

        return result
    }
}