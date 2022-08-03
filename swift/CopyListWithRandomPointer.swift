// https://leetcode.com/problems/copy-list-with-random-pointer/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var head = head, first = head
        while head != nil {
            let node = Node(head!.val)
            node.next = head?.next
            head?.next = node
            head = node.next
        }
        head = first
        while head != nil {
            let next = head!.next!
            next.random = head?.random?.next
            head = next.next
        }
        head = first
        first = first?.next
        while head != nil {
            let next = head!.next!
            head?.next = next.next
            head = head?.next
            next.next = head?.next
        }
        return first
    }
}