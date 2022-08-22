// https://leetcode.com/problems/find-k-closest-elements/

class Solution {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var l = 0
        var r = arr.count - k
        
        while l < r {
            let m = l + (r - l) / 2
            if x - arr[m] > arr[m + k] - x {
                l = m + 1
            } else {
                r = m
            }
        }
        
        return Array(arr[l..<l + k])
    }
}