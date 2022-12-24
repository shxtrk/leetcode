// https://leetcode.com/problems/domino-and-tromino-tiling/

class Solution {
    let mod: Int64 = 1000000007
    var fmap = [Int: Int64]()
    var pmap = [Int: Int64]()

    func p(_ n: Int) -> Int64 { 
        if pmap[n] != nil {
            return pmap[n]!
        }
        var val: Int64
        if n == 2 {
            val = 1
        } else {
            val = (p(n - 1) + f(n - 2)) % mod;
        }
        pmap[n] = val
        return val
    }

    func f(_ n: Int) -> Int64 {  
        if fmap[n] != nil {
            return fmap[n]!
        }
        var val: Int64
        if n == 1 {
            val = 1
        } else if n == 2 {
            val = 2
        } else {
            val = (f(n - 1) + f(n - 2) + 2 * p(n - 1)) % mod
        }
        fmap[n] = val
        return val
    }

    func numTilings(_ n: Int) -> Int {
        Int(f(n))
    }
}