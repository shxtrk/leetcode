// https://leetcode.com/problems/happy-number/

class Solution {
    var set = Set<Int>()
    
    func isHappy(_ n: Int) -> Bool {
        
        guard n != 1 else { return true }
        guard !set.contains(n) else { return false }
        set.insert(n)
        
        var sum = 0
        var n = n
        while n != 0 {
            sum += (n % 10) * (n % 10)
            n = n / 10
        }
        return isHappy(sum)
    }
}