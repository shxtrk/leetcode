// https://leetcode.com/problems/kth-largest-element-in-an-array/

class Solution {

    class KSizedMinHeap {
        private let k: Int
        private var heap: [Int]

        var top: Int { heap.first ?? Int.min }

        init(_ k: Int) {
            self.k = k
            self.heap = []
        }

        func insert(_ val: Int) {
            if heap.count < k {
                heap.append(val)
                siftUp(heap.count - 1)
            } else if val > top {
                heap[0] = val
                siftDown(0)
            }
        }

        func siftUp(_ i: Int) {
            let parent = (i - 1) / 2
            guard parent >= 0, heap[parent] > heap[i] else { return }
            heap.swapAt(parent, i)
            siftUp(parent)
        }

        func siftDown(_ i: Int) {
            let left = i * 2 + 1
            let right = i * 2 + 2

            var max = i
            if left < heap.count, heap[i] > heap[left] {
                max = left
            }
            if right < heap.count, heap[max] > heap[right] {
                max = right
            }

            guard max != i else { return }
            heap.swapAt(i, max)
            siftDown(max)
        }
    }

    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let heap = KSizedMinHeap(k)
        for n in nums {
            heap.insert(n)
        }
        return heap.top
    }
}