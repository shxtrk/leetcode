// https://leetcode.com/problems/middle-of-the-linked-list/

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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var mid: ListNode? = head
        var last: ListNode? = head
        
        while last?.next != nil {
            mid = mid?.next
            last = last?.next?.next
        }
        return mid
    }
}