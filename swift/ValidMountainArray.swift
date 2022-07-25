// https://leetcode.com/problems/valid-mountain-array/

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        var i = 0
        
        while i < arr.count - 1 && arr[i] < arr[i + 1] {
            i += 1
        }
        
        if i == 0 || i == arr.count - 1 {
            return false
        }
        
        while i < arr.count - 1 && arr[i] > arr[i + 1] {
            i += 1
        }
        
        return i == arr.count - 1
    }
}