// https://leetcode.com/problems/count-univalue-subtrees/

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
    
    var count = 0
    
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        isValid(root!)
        return count
    }
    
    func isValid(_ node: TreeNode) -> Bool {
        if node.left == nil && node.right == nil {
            count += 1
            return true
        }
        
        var isUni = true
        
        if node.left != nil {
            isUni = isValid(node.left!) && isUni && node.left!.val == node.val;
        }

        if node.right != nil {
            isUni = isValid(node.right!) && isUni && node.right!.val == node.val;
        }
        
        if !isUni {
            return false
        }
        count += 1
        return true
        
    }
}