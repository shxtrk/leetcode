// https://leetcode.com/problems/maximum-difference-between-node-and-ancestor/

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
    func maxAncestorDiff(_ root: TreeNode?) -> Int {
        var res = 0

        func helper(_ root: TreeNode?, _ minVal: Int, _ maxVal: Int) {
            guard root != nil else { return }
            let diff = max(abs(minVal - root!.val), abs(maxVal - root!.val))
            res = diff > res ? diff : res
            helper(root!.left, min(minVal, root!.val), max(maxVal, root!.val))
            helper(root!.right, min(minVal, root!.val), max(maxVal, root!.val))
        }
        helper(root, root!.val, root!.val)
        
        return res
    }
}