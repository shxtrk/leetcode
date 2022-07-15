// https://leetcode.com/problems/richest-customer-wealth/

class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        accounts.compactMap { $0.reduce(0) { $0 + $1 } }.max()!
    }
}