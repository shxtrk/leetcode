// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0

        for price in prices {
            minPrice = min(minPrice, price)
            maxProfit = max(maxProfit, price - minPrice)
        }

        return maxProfit
    }
}

// DP Solution:

// class Solution {
//     func maxProfit(_ prices: [Int]) -> Int {

//         var mins = [prices[0]]
//         for i in stride(from: 1, to: prices.count, by: 1) {
//             mins.append(min(mins[i - 1], prices[i]))
//         }

//         var result = 0
//         for i in stride(from: 0, to: prices.count, by: 1) {
//             print(prices[i] - mins[i])
//             result = max(result, prices[i] - mins[i])
//         }

//         return result
//     }
// }