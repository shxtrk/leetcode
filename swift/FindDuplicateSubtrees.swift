// https://leetcode.com/problems/find-duplicate-subtrees/

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
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        var map = [String: Int]()
        var array = [TreeNode?]()
        findDuplicateSubtreesRecursively(root, &map, &array)
        return array
    }
    
    func findDuplicateSubtreesRecursively(_ root: TreeNode?,
                                          _ map: inout [String: Int],
                                          _ array: inout [TreeNode?]) -> String {
        guard let root = root else { return "" }
        var str = String(root.val)
        str += "l" + findDuplicateSubtreesRecursively(root.left, &map, &array)
        str += "r" + findDuplicateSubtreesRecursively(root.right, &map, &array)
        map[str, default: 0] += 1
        if map[str] == 2 {
            array.append(root)
        }
        return str
    }
}