// https://leetcode.com/problems/closest-binary-search-tree-value/

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
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        return closestValue(root, target, nil)
    }
    
    func closestValue(_ root: TreeNode?, _ target: Double, _ closest: Int?) -> Int {
        guard root != nil else { return closest ?? 0 }
        
        var newClosest: Int
        if closest != nil && abs(target - Double(closest!)) < abs(target - Double(root!.val)) {
            newClosest = Int(closest!)
        } else {
            newClosest = root!.val
        }
        
        if target < Double(root!.val) {
            return closestValue(root!.left, target, newClosest)
        } else {
            return closestValue(root!.right, target, newClosest)
        }
    }
}