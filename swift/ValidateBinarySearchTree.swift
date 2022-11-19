// https://leetcode.com/problems/validate-binary-search-tree/

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

    func isValidBST(_ root: TreeNode?) -> Bool {

        var list = [Int]()

        func fillList(_ node: TreeNode?) {
            guard let node = node else { return }
            fillList(node.left)
            list.append(node.val)
            fillList(node.right)
        }

        fillList(root)

        for i in 1..<list.count {
            if list[i] <= list[i - 1] {
                return false
            }
        }

        return true
    }
}