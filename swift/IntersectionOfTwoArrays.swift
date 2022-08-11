// https://leetcode.com/problems/intersection-of-two-arrays/

class Solution {
    
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set1 = Set(nums1)
        var set2 = Set(nums2)
        
        var result = [Int]()
        for i in set1 {
            if set2.contains(i) {
                result.append(i)
            }
        }
        return result
    }
    
    /* Built-in solution
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        Array(Set(nums1).intersection(Set(nums2)))
    }
    */
}