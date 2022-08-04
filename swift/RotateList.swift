// https://leetcode.com/problems/rotate-list/

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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head != nil, k != 0 else {
            return head
        }
        
        var lenght = 0
        var node = head
        var last = head
        
        while node != nil {
            lenght += 1
            last = node
            node = node?.next
        }
        
        let shift = k % lenght
        let toLast = lenght - shift
        
        guard shift > 0 else {
            return head
        }
        
        last?.next = head
        node = head
        for _ in stride(from: toLast - 1, to: 0, by: -1) {
            node = node?.next
        }
        var head = node?.next
        node?.next = nil
        return head
    }
}