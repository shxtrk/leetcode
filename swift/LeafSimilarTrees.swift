// https://leetcode.com/problems/leaf-similar-trees/

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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        func sequence(from root: TreeNode?) -> [Int] {
            guard root?.left != nil || root?.right != nil else { 
                return root == nil ? [] : [root!.val]
            }
            return sequence(from: root?.left) + sequence(from: root?.right)
        }
        return sequence(from: root1).elementsEqual(sequence(from: root2))
    }
}