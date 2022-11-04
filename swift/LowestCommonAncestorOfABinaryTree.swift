// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

 class Solution {
     var first = [TreeNode]()
     var second = [TreeNode]()

    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        find(root, p!, &first)
        find(root, q!, &second)
        var res = root
        for i in 0...min(first.count, second.count) - 1 {
            if first[i] === second[i] {
                res = first[i]
            }
        }
        return res
    }

    func find(_ root: TreeNode?, _ target: TreeNode, _ arr: inout [TreeNode]) -> Bool {
        guard root != nil else { return false }

        if root! === target {
            arr.append(root!)
            return true
        } else {
            arr.append(root!)
            if find(root!.left, target, &arr) || find(root!.right, target, &arr) {
                return true
            } else {
                arr.removeLast()
                return false
            }
        }
    }
}