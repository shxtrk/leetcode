// https://leetcode.com/problems/binary-search/

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return -1 }
        return search(nums, target, 0, nums.count - 1)
    }
    
    func search(_ nums: [Int], _ target: Int, _ min: Int, _ max: Int) -> Int {
        guard min <= max else { return -1 }
        let mid = min + (max - min) / 2
        if nums[mid] < target {
            return search(nums, target, mid + 1, max)
        } else if nums[mid] > target {
            return search(nums, target, min, mid - 1)
        } else {
            return mid
        }
    }
}