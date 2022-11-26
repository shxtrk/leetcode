// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        var nums = nums
        func constructBST(_ left: Int, _ right: Int) -> TreeNode? {
            if left > right { return nil }
            let mid = left + (right - left) / 2
            let node = TreeNode(nums[mid])
            node.left = constructBST(left, mid - 1)
            node.right = constructBST(mid + 1, right)
            return node
        }
        return constructBST(0, nums.count - 1)
    }
}