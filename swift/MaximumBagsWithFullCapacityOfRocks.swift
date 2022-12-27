// https://leetcode.com/problems/maximum-bags-with-full-capacity-of-rocks/

class Solution {

    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
        var additionalRocks = additionalRocks
        var diffs = capacity.enumerated().map { $1 - rocks[$0] }
        
        func siftDown(_ x: Int) {
            let left = x * 2 + 1
            let right = x * 2 + 2

            var maximum = x

            if left < diffs.count && diffs[maximum] > diffs[left] {
                maximum = left
            }

            if right < diffs.count && diffs[maximum] > diffs[right] {
                maximum = right
            }

            if maximum != x {
                diffs.swapAt(maximum, x)
                siftDown(maximum)
            }
        }

        func pop() -> Int {
            diffs.swapAt(0, diffs.count - 1)
            let top = diffs.removeLast()
            if !diffs.isEmpty { siftDown(0) }
            return top
        }

        for i in stride(from: diffs.count / 2, through: 0, by: -1) {
            siftDown(i)
        }

        var numberOfBags = 0
        for i in 0..<diffs.count {
            var diff = pop()
            additionalRocks = additionalRocks - diff
            if additionalRocks >= 0 {
                numberOfBags = numberOfBags + 1
            } 
        }

        return numberOfBags
    }
}