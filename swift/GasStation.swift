// https://leetcode.com/problems/gas-station/

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let n = gas.count
        var totalTank = 0
        var currentTank = 0
        var position = 0

        for i in 0..<n {
            totalTank += gas[i] - cost[i]
            currentTank += gas[i] - cost[i]

            if currentTank < 0 {
                currentTank = 0
                position = i + 1
            }
        }

        return totalTank >= 0 ? position : -1
    }
}