// https://leetcode.com/problems/rotate-array/

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        
        let n = nums.count
        let nk = k % n
        
        var start = 0
        var count = 0
        
        while count < n {
            var curr = start
            var prevVal = nums[curr]
            
            repeat {
                var next = (curr + nk) % n
                
                let tmp = nums[next]
                nums[next] = prevVal
                prevVal = tmp
                
                curr = next
                count += 1
            } while start != curr
            
            start += 1
        }
    }
}