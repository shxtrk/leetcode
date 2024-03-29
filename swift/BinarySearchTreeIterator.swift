// https://leetcode.com/problems/binary-search-tree-iterator/

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

class BSTIterator {

    var stack = [TreeNode]()

    init(_ root: TreeNode?) {
        guard let root = root else { return }
        stack.append(root)

        while stack.last!.left != nil {
            stack.append(stack.last!.left!)
        }
    }
    
    func next() -> Int {
        let node = stack.removeLast()

        if node.right != nil {
            stack.append(node.right!)

            while stack.last!.left != nil {
                stack.append(stack.last!.left!)
            }
        } 
        return node.val
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */