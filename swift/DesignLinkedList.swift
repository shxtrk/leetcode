// https://leetcode.com/problems/design-linked-list/submissions/

class MyLinkedList {
    
    class Node {
        var val: Int?
        var next: Node?
        
        init(val: Int? = nil, next: Node? = nil) {
            self.val = val
            self.next = next
        }
    }
    
    private var head: Node

    init() {
        head = Node()
    }
    
    func get(_ index: Int) -> Int {
        var target = head.next
        var counter = 0
        while counter < index {
            target = target?.next
            counter += 1
        }
        return target?.val ?? -1
    }
    
    func addAtHead(_ val: Int) {
        head.next = Node(val: val, next: head.next)
    }
    
    func addAtTail(_ val: Int) {
        var tail = head
        while tail.next != nil {
            tail = tail.next!
        }
        tail.next = Node(val: val)
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index >= 0 else { return }
        
        var target: Node? = head
        var counter = 0
        while counter < index {
            target = target?.next
            counter += 1
        }
        target?.next = Node(val: val, next: target?.next)
    }
    
    func deleteAtIndex(_ index: Int) {
        guard index >= 0 else { return }
        
        var prev: Node? = head
        var counter = 0
        while counter < index {
            prev = prev?.next
            counter += 1
        }
        
        prev?.next = prev?.next?.next
    }
}