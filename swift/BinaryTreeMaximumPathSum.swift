// https://leetcode.com/problems/binary-tree-maximum-path-sum/

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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxSum = Int.min
        func helper(_ root: TreeNode?) -> Int {
            guard root != nil else { return 0 }
            let left = max(helper(root!.left), 0)
            let right = max(helper(root!.right), 0)
            maxSum = max(maxSum, left + right + root!.val)
            return max(left + root!.val, right + root!.val)
        }
        helper(root)
        return maxSum
    }
}
