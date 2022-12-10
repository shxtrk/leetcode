// https://leetcode.com/problems/minimum-absolute-difference/

class Solution {
    func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
        let min = arr.min()!
        let max = arr.max()!
        let shift = -min
        var aux = Array<Int>(repeating: 0, count: max - min + 1)

        for i in stride(from: 0, to: arr.count, by: 1) {
            aux[arr[i] + shift] = arr[i]
        }

        var res = [[Int]]()
        var minDiff = Int.max
        var last = 0
        for i in stride(from: 1, to: aux.count, by: 1) {
            guard aux[i] != 0 else { continue }

            let diff = abs(aux[last] - aux[i])
            if diff < minDiff {
                res = [[aux[last], aux[i]]]
                minDiff = diff
            } else if diff == minDiff {
                res.append([aux[last], aux[i]])
            }

            last = i
        }
        
        return res
    }
}