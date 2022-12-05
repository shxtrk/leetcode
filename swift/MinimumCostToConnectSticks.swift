// https://leetcode.com/problems/minimum-cost-to-connect-sticks/

class Solution {

    class MinHeap {
        private var heap = [Int]()

        init(_ vals: [Int]) {
            heap = vals
            for i in stride(from: heap.count / 2, through: 0, by: -1) {
                siftDown(i)
            }
        }

        func pop() -> Int? {
            guard heap.count > 0 else { return nil }
            let ret = heap[0]
            heap[0] = heap[heap.count - 1]
            heap.removeLast()
            siftDown(0)
            return ret
        }

        func push(_ val: Int) {
            heap.append(val)
            siftUp(heap.count - 1)
        }

        func siftUp(_ i: Int) {
            var i = i
            var parent = (i - 1) / 2
            while parent >= 0, heap[parent] > heap[i] {
                heap.swapAt(i, parent)
                i = parent
                parent = (i - 1) / 2
            }
        }

        func siftDown(_ i: Int) {
            var i = i
            var left = i * 2 + 1
            var right = i * 2 + 2

            while true {
                var max = i

                if left < heap.count, heap[left] < heap[i] {
                    max = left
                }

                if right < heap.count, heap[right] < heap[max] {
                    max = right
                }

                if max == i { break }

                heap.swapAt(i, max)
                i = max
                left = i * 2 + 1
                right = i * 2 + 2
            }
        }
    }

    func connectSticks(_ sticks: [Int]) -> Int {
        let heap = MinHeap(sticks)
        var totalCost = 0

        while let min1 = heap.pop(), let min2 = heap.pop() {
            totalCost += min1 + min2
            heap.push(min1 + min2)
        }

        return totalCost
    }
}