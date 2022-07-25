// https://leetcode.com/problems/duplicate-zeros/

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var length = arr.count - 1
        var count = 0
        
        var i = 0
        while i <= length - count {
            if arr[i] == 0 {
                if (i == length - count) {
                    arr[length] = 0
                    length -= 1
                    break
                }
                count += 1
            }
            i += 1
        }
        
        i = length - count
        while i >= 0 {
            if arr[i] == 0 {
                arr[i + count] = 0
                count -= 1
                arr[i + count] = 0
            } else {
                arr[i + count] = arr[i]
            }
            i -= 1
        }
    }
}