// https://leetcode.com/problems/insertion-sort-list/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Solution {
        func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        
        let dummy = ListNode(0)
        var cur: ListNode? = head
        var pre: ListNode? = dummy
        var next: ListNode? = nil
        
        while cur != nil {
            next = cur?.next
            while pre?.next != nil && pre!.next!.val < cur!.val {
                pre = pre?.next
            }
            cur?.next = pre?.next
            pre?.next = cur
            pre = dummy
            cur = next
        }
        
        return dummy.next
    }
}