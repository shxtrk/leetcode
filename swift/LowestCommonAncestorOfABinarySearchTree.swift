// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/

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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if p!.val > root!.val && q!.val > root!.val {
            return lowestCommonAncestor(root!.right, p, q)
        } else if p!.val < root!.val && q!.val < root!.val {
            return lowestCommonAncestor(root!.left, p, q)
        } else {
            return root
        }
    }
}