// https://leetcode.com/problems/sort-an-array/

class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var nums = nums
        heapify(&nums, nums.count)
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            nums.swapAt(0, i)
            siftDown(&nums, 0, i)
        }
        return nums
    }
    
    func heapify(_ nums: inout [Int], _ n: Int) {
        for i in stride(from: n / 2, through: 0, by: -1) {
            siftDown(&nums, i, n)
        }
    }

    func siftDown(_ nums: inout [Int], _ i: Int, _ n: Int) {
        let left = i * 2 + 1
        let right = i * 2 + 2
        var min = i
        if left < n, nums[i] < nums[left] {
            min = left
        }
        if right < n, nums[min] < nums[right] {
            min = right
        }
        guard min != i else { return }
        nums.swapAt(i, min)
        siftDown(&nums, min, n)
    }
}