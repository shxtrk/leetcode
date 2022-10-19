// https://leetcode.com/problems/path-sum/

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
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        return hasPathSum(root, targetSum, 0)
    }

    func hasPathSum(_ root: TreeNode, _ targetSum: Int, _ sum: Int) -> Bool {
        if root.left == nil && root.right == nil {
            return sum + root.val == targetSum
        }
        if let left = root.left {
            if hasPathSum(left, targetSum, sum + root.val) {
                return true
            }
        }
        if let right = root.right {
            if hasPathSum(right, targetSum, sum + root.val) {
                return true
            }
        }
        return false
    }
}