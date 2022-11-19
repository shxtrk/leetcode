// https://leetcode.com/problems/inorder-successor-in-bst/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        guard let target = p?.val else { return nil }

        var successor: TreeNode? = nil

        func find(_ root: TreeNode?) {
            guard let root = root else { return }

            if root.val > target {
                successor = root
                find(root.left)
            } else {
                find(root.right)
            }
        }

        find(root)

        return successor
    }
}