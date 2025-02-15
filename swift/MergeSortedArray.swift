// https://leetcode.com/problems/merge-sorted-array/

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = 0
        var p2 = 0
        var counter = 0

        let nums1c = nums1[0..<m]

        for i in 0..<m+n {
            if p2 >= n || (p1 < m && nums1c[p1] < nums2[p2])  {
                nums1[i] = nums1c[p1]
                p1 += 1
            } else if p2 < n {
                nums1[i] = nums2[p2]
                p2 += 1
            }
        }
    }
}
