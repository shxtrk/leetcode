// https://leetcode.com/problems/min-stack/

class MinStack {
    
    var array = [Int]()
    var min = [Int]()

    init() { }
    
    func push(_ val: Int) {
        array.append(val)
        if let last = min.last {
            if val <= last {
                min.append(val)
            }
        } else {
            min.append(val)
        }
    }
    
    func pop() {
        let last = array.removeLast()
        if let m = min.last, m == last {
            min.removeLast()
        }
    }
    
    func top() -> Int {
        array.last ?? 0
    }
    
    func getMin() -> Int {
        min.last ?? 0
    }
}