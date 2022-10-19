// https://leetcode.com/problems/symmetric-tree/

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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else { return false }
        return isSame(root!.left, root!.right)
    }

    func isSame(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        } else if left == nil || right == nil {
            return false
        } else if left!.val != right!.val {
            return false
        }
        return isSame(left!.left, right!.right) && isSame(right!.left, left!.right)
    }
}