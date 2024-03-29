// https://leetcode.com/problems/binary-tree-postorder-traversal/

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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [] }
        var result = [Int]()
        var stack = [TreeNode]()
        var curr = root

        while !stack.isEmpty || curr != nil {
            if curr != nil {
                stack.append(curr!)
                result.insert(curr!.val, at: 0)
                curr = curr?.right
            } else {
                curr = stack.removeLast()
                curr = curr?.left
            }
        }

        return result
    }
}