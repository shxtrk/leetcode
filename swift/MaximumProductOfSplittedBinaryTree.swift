// https://leetcode.com/problems/maximum-product-of-splitted-binary-tree/

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

    var totalSum = 0
    var best = 0

    func maxProduct(_ root: TreeNode?) -> Int {
        totalSum = findSum(root)
        findMaxProduct(root)
        return best % (1000000007)
    }

    func findMaxProduct(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        let leftSum = findMaxProduct(root!.left)
        best = max(best, leftSum * (totalSum - leftSum))
        let rightSum = findMaxProduct(root!.right)
        best = max(best, rightSum * (totalSum - rightSum))
        return leftSum + rightSum + root!.val
    }

    func findSum(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        return findSum(root?.left) + findSum(root?.right) + root!.val
    }
}