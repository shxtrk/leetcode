// https://leetcode.com/problems/powx-n/

class Solution {
    private func fastPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else { return 1 }
        
        let half = fastPow(x, n / 2)
        
        if n % 2 == 0 {
            return half * half
        } else {
            return half * half * x
        }
    }
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        return fastPow(n < 0 ? 1 / x : x, n < 0 ? -n : n)
    }
}