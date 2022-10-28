// https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/

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
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        guard postorder.last != nil else { return nil }
        let root = TreeNode(postorder.last!)
        guard postorder.count > 1 else { return root }
        let leftIndex = inorder.firstIndex(of: root.val)!
        root.left = buildTree(Array(inorder[0..<leftIndex]),
                              Array(postorder[0..<leftIndex]))
        root.right = buildTree(Array(inorder[leftIndex + 1..<inorder.count]),
                               Array(postorder[leftIndex..<postorder.count - 1]))

        return root
    }
}