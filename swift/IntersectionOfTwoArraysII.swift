// https://leetcode.com/problems/intersection-of-two-arrays-ii/

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        for n in nums1 {
            map[n] = map[n] != nil ? map[n]! + 1 : 1
        }
        
        var result = [Int]()
        for n in nums2 {
            if let c = map[n] {
                map[n] = c > 1 ? c - 1 : nil
                result.append(n)
            }
        }
        return result
    }
}