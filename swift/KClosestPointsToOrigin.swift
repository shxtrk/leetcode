// https://leetcode.com/problems/k-closest-points-to-origin/

class Solution {

    class KSizedMaxHeap {
        private let k: Int
        private var heap = [(val: Double, points: [Int])]()

        init(_ k: Int) {
            self.k = k
        }

        func insert(_ val: Double, _ points: [Int]) {
            if heap.count < k {
                heap.append((val, points))
                siftUp(heap.count - 1)
            } else if val < heap.first!.val {
                heap[0] = (val, points)
                siftDown(0)
            }
        }

        func siftDown(_ i: Int) {
            let left = i * 2 + 1
            let right = i * 2 + 2

            var min = i
            if left < heap.count, heap[i].val < heap[left].val {
                min = left
            }
            if right < heap.count, heap[min].val < heap[right].val {
                min = right
            }

            guard min != i else { return }
            heap.swapAt(i, min)
            siftDown(min)
        }

        private func siftUp(_ i: Int) {
            let parent = (i - 1) / 2
            guard parent >= 0, heap[parent].val < heap[i].val else { return }
            heap.swapAt(parent, i)
            siftUp(parent)
        }

        func all() -> [[Int]] {
            return heap.map { $0.points }
        }
    }

    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let heap = KSizedMaxHeap(k)

        for p in points {
            heap.insert(abs(sqrt(pow(Double(0 - p[0]), 2) + 
                                 pow(Double(0 - p[1]), 2))), p)
        }
        
        return heap.all()
    }
}