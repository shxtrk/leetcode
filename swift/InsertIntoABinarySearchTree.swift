// https://leetcode.com/problems/insert-into-a-binary-search-tree/

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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard root != nil else { return TreeNode(val) }

        var node = root
        while node != nil {
            if val > node!.val {
                 if node!.right == nil {
                     node!.right = TreeNode(val)
                     break
                 } else {
                     node = node!.right
                 }
            } else {
                if node!.left == nil {
                    node!.left = TreeNode(val)
                    break
                } else {
                    node = node!.left
                }
            }
        }
        
        return root
    }
}