// https://leetcode.com/problems/meeting-rooms-ii/

class Solution {

    class MinHeap {
        private var heap = [Int]()
        var count: Int { heap.count }
        var top: Int { heap.first! }

        func push(_ val: Int) {
            heap.append(val)
            siftUp(heap.count - 1)
        }

        func pop() {
            guard heap.count > 0 else { return }
            heap[0] = heap[heap.count - 1]
            heap.removeLast()
            siftDown(0)
            print(heap)
        }

        private func siftUp(_ i: Int) {
            let parent = (i - 1) / 2
            guard parent >= 0, heap[parent] > heap[i] else { return }
            heap.swapAt(parent, i)
            siftUp(parent)
        }

        private func siftDown(_ i: Int) {
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

    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        let ivs = intervals.sorted { $0[0] < $1[0] }
        let heap = MinHeap()
        heap.push(ivs[0][1])
        for i in stride(from: 1, to: ivs.count, by: 1) {
            if heap.top <= ivs[i][0] {
                heap.pop()
            }
            heap.push(ivs[i][1])
        }
        return heap.count
    }
}