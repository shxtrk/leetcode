// https://leetcode.com/problems/contains-duplicate-ii/

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        for (i, n) in nums.enumerated() {
            if set.contains(n) { return true }
            set.insert(n)
            if set.count > k {
                set.remove(nums[i - k])
            }
        }
        return false
    }
}