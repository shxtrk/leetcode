// https://leetcode.com/problems/linked-list-cycle-ii/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
       var pointer: Set<UnsafeMutableRawPointer> = []
       var ptr : ListNode? = head
       while ptr != nil {
           let res = pointer.insert(Unmanaged.passUnretained(ptr!).toOpaque())
           if !res.inserted { return ptr }
           ptr = ptr?.next
       }
       return nil
    }
}