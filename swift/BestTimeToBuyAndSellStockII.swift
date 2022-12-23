// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buyPrice = -1
        var sellPrice = -1
        var profit = 0

        for price in prices {

            if buyPrice == -1 {
                buyPrice = price
                continue
            }

            if sellPrice == -1 {
                if price <= buyPrice  {
                    buyPrice = price
                } else {
                    sellPrice = price
                }
                continue
            }
            
            if price > sellPrice {
                sellPrice = price
            } else if price < sellPrice {
                profit = profit + (sellPrice - buyPrice)
                sellPrice = -1
                buyPrice = price
            }
        }

        if sellPrice > buyPrice {
            profit = profit + (sellPrice - buyPrice)
        }

        return profit
    }
}