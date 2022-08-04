// https://leetcode.com/problems/design-circular-queue/


class MyCircularQueue {
    
    private class Node {
        var val: Int
        var next: Node?
        
        init(_ val: Int, _ next: Node? = nil) {
            self.val = val
            self.next = next
        }
    }
    
    private var head: Node? = nil
    private var tail: Node? = nil
    
    private var capacity: Int
    private var size: Int = 0

    init(_ k: Int) {
        capacity = k
    }
    
    func enQueue(_ value: Int) -> Bool {
        guard size < capacity else { return false }
        if tail != nil {
            tail?.next = Node(value)
            tail = tail?.next
        } else {
            head = Node(value)
            tail = head
        }
        size += 1
        return true
    }
    
    func deQueue() -> Bool {
        guard size > 0 else { return false }
        head = head?.next
        size -= 1
        if head == nil {
            tail = nil
        }
        return true
    }
    
    func Front() -> Int {
        return head?.val ?? -1
    }
    
    func Rear() -> Int {
        return tail?.val ?? -1
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func isFull() -> Bool {
        return size == capacity
    }
}