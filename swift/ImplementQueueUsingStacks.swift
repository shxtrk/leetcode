// https://leetcode.com/problems/implement-queue-using-stacks/

class MyQueue {

    var pushStack = [Int]()
    var popStack = [Int]()

    init() { }
    
    func push(_ x: Int) {
        if !popStack.isEmpty {
            while !popStack.isEmpty {
                pushStack.append(popStack.removeLast())
            }
        }
        return pushStack.append(x)
    }
    
    func pop() -> Int {
        while !pushStack.isEmpty {
            popStack.append(pushStack.removeLast())
        }
        return popStack.removeLast()
    }
    
    func peek() -> Int {
        while !pushStack.isEmpty {
            popStack.append(pushStack.removeLast())
        }
        return popStack.last!
    }
    
    func empty() -> Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
}