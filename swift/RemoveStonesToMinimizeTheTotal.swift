// https://leetcode.com/problems/remove-stones-to-minimize-the-total/

class Solution {
    func minStoneSum(_ piles: [Int], _ k: Int) -> Int {

        func siftDown(_ i: Int) {
            let left = i * 2 + 1
            let right = i * 2 + 2
            var maximal = i

            if left < heap.count, heap[maximal] < heap[left] {
                maximal = left
            }

            if right < heap.count, heap[right] > heap[maximal] {
                maximal = right
            }

            guard maximal != i else { return }
            heap.swapAt(maximal, i)
            siftDown(maximal)
        }

        func siftUp(_ i: Int) {
            let parent = (i - 1) / 2
            if heap[parent] < heap[i] {
                heap.swapAt(parent, i)
                siftUp(parent)
            }
        }

        func insert(_ x: Int) {
            heap.append(x)
            siftUp(heap.count - 1)
        }

        func pop() -> Int {
            heap.swapAt(0, heap.count - 1)
            let top = heap.removeLast()
            if !heap.isEmpty {
                siftDown(0)
            }
            return top
        }

        var heap = piles

        for i in stride(from: heap.count / 2, through: 0, by: -1) {
            siftDown(i)
        }

        for _ in 0..<k {
            let top = pop()
            insert(top - top / 2)
        }
        
        return heap.reduce(0, +)
    }
}