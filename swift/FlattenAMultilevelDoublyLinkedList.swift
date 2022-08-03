// https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var prev: Node?
 *     public var next: Node?
 *     public var child: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.prev = nil
 *         self.next = nil
 *         self.child  = nil
 *     }
 * }
 */

class Solution {
    func flatten(_ head: Node?) -> Node? {
        return flattenRec(head).0
    }
    
    func flattenRec(_ head: Node?) -> (Node?, Node?) {
        var last = head
        
        while last != nil {
            if last!.child != nil {
                var ret = flattenRec(last!.child)
                last?.next?.prev = ret.1
                last?.next?.prev?.next = last?.next
                last?.next = ret.0
                last?.next?.prev = last
                last?.child = nil
                last = ret.1
            } else {
                if last?.next == nil {
                    return (head, last)
                } else {
                    last = last?.next
                }
            }
        }
        
        return (head, last)
    }
}