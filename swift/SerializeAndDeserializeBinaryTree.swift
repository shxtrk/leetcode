// https://leetcode.com/problems/serialize-and-deserialize-binary-tree/

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

 class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var result: [String] = [String]()

        func recursively(_ root: TreeNode?) {
            guard root != nil else {
                result.append("nil")
                return
            }

            result.append("\(root!.val)")
            recursively(root!.left)
            recursively(root!.right)
        }

        recursively(root)

        return result.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var nodes: [Int?] = data.split(separator: ",").reversed().map { Int(String($0)) }

        func recursively() -> TreeNode? {
            let last: Int? = nodes.removeLast()

            guard last != nil else {
                return nil
            }

            let node = TreeNode(last!)
            node.left = recursively()
            node.right = recursively()

            return node
        }

        return recursively() 
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))