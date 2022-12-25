// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-with-cooldown/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = [Int](repeating: 0, count: prices.count + 2)

        for i in stride(from: prices.count - 1, through: 0, by: -1) {
            var profit = 0
            
            for sell in stride(from: i + 1, to: prices.count, by: 1) {
                profit = max(profit, (prices[sell] - prices[i]) + dp[sell + 2])
            }

            dp[i] = max(profit, dp[i + 1])
        }

        return dp[0]
    }
}