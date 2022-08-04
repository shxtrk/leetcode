// https://leetcode.com/problems/moving-average-from-data-stream/

class MovingAverage {
    
    private var size: Int = 0
    private var sum: Int = 0
    private var arr = [Int]()

    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        if arr.count == size {
            sum -= arr.removeFirst()
        }
        sum += val
        arr.append(val)
        
        return Double(sum) / Double(arr.count)
    }
}