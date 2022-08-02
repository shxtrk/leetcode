// https://leetcode.com/problems/merge-two-sorted-lists/

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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        var head = ListNode()
        var tail: ListNode? = head
        var list1 = list1
        var list2 = list2
        
        while tail != nil {
            guard let uList1 = list1 else {
                tail?.next = list2
                break
            }
            guard let uList2 = list2 else {
                tail?.next = list1
                break
            }
            if uList1.val < uList2.val {
                tail?.next = list1
                list1 = list1?.next
            } else {
                tail?.next = list2
                list2 = list2?.next
            }
            tail = tail?.next
        }
        
        return head.next
    }
}