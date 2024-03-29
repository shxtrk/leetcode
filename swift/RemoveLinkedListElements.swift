// https://leetcode.com/problems/remove-linked-list-elements/

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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        if head.val == val {
            return removeElements(head.next, val)
        } else {
            head.next = removeElements(head.next, val)
        }
        return head
    }
}