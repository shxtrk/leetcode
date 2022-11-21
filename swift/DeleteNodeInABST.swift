// https://leetcode.com/problems/delete-node-in-a-bst/

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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let root = root else { return nil }

        if key > root.val {
            root.right = deleteNode(root.right, key)
        } else if key < root.val {
            root.left = deleteNode(root.left, key)
        } else {
            if root.left == nil && root.right == nil {
                return nil
            } else if root.right != nil {
                root.val = successorVal(root)
                root.right = deleteNode(root.right, root.val)
            } else {
                root.val = predecessorVal(root)
                root.left = deleteNode(root.left, root.val)
            }
        }
        return root
    }

    func successorVal(_ root: TreeNode) -> Int {
        var root = root.right
        while (root?.left != nil) {
            root = root?.left
        }
        return root!.val
    }

    func predecessorVal(_ root: TreeNode) -> Int {
        var root = root.left
        while (root?.right != nil) {
            root = root?.right
        }
        return root!.val
    }
}