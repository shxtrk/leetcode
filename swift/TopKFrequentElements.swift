// https://leetcode.com/problems/top-k-frequent-elements/

class Solution {

    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for n in nums {
            dict[n] = (dict[n] ?? 0) + 1
        }
        var heap = dict.map { ($0, $1) }

        for i in stride(from: heap.count / 2, to: -1, by: -1) {
            sift(&heap, i, heap.count)
        }

        for i in stride(from: heap.count - 1, through: 0, by: -1) {
            heap.swapAt(0, i)
            sift(&heap, 0, i)
        }

        return Array(heap.map { $0.0 }[heap.count - k ..< heap.count])
    }

    func sift(_ nums: inout [(Int, Int)], _ i: Int, _ size: Int) {
        var largest = i

        let left = i * 2 + 1
        let right = i * 2 + 2

        if left < size, nums[left].1 > nums[largest].1 {
            largest = left
        }
        
        if right < size, nums[right].1 > nums[largest].1 {
            largest = right
        }

        if largest != i {
            nums.swapAt(largest, i)
            sift(&nums, largest, size)
        }
    }
}