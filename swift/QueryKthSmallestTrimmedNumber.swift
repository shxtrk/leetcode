// https://leetcode.com/problems/query-kth-smallest-trimmed-number/

class Solution {
    func smallestTrimmedNumbers(_ nums: [String], _ queries: [[Int]]) -> [Int] {

        let s = nums.first ?? ""
        let n = nums.count
        var sorted = nums
        
        var result = [Int]()
        var memo = [Int: [String]]()

        func radix(_ trim: Int) {
            if let cached = memo[trim] {
                sorted = cached
            } else {
                var index = s.endIndex
                for i in 0..<trim {
                    index = s.index(before: index)
                    sort(by: index)
                    memo[i + 1] = sorted
                }
            }
        }

        func sort(by index: String.Index) {
            var counter = Array<Int>(repeating: 0, count: 11)
            var new = Array<String>(repeating: "", count: n)
            for i in 0..<n {
                let val = Int(String(sorted[i][index]))!
                counter[val + 1] = counter[val + 1] + 1
            }
            for i in 0..<10 {
                counter[i + 1] = counter[i] + counter[i + 1]
            }
            for (i, num) in sorted.enumerated() {
                let val = Int(String(num[index]))!
                new[counter[val]] = num
                counter[val] = counter[val] + 1
            }
            sorted = new
        }

        for q in queries {
            sorted = nums
            radix(q[1])
            let original = sorted[q[0] - 1]
            var index = 0
            var k = 0
            for (i, n) in nums.enumerated() {
                if original == n && k < q[1] {
                    index = i
                    k = k + 1
                }
            }
            result.append(index)
        }

        return result
    }
}