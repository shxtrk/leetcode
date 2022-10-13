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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n > 0 else { return [] } // be careful
        return generateTrees(1, n)
    }
    
    func generateTrees(_ m: Int, _ n: Int) -> [TreeNode?] {
        if m > n {
            return [nil] // I love Swift
        } else if m == n {
            return [TreeNode(m)]
        } else {
            var result = [TreeNode?]()
            for i in m...n {
                for left in generateTrees(m, i-1) {
                    for right in generateTrees(i+1, n) {
                        let root = TreeNode(i)
                        root.left = left
                        root.right = right
                        result.append(root)
                    }
                }
            }
            return result
        }
    }
}