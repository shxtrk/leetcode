// https://leetcode.com/problems/sort-colors/

class Solution {
    func sortColors(_ nums: inout [Int]) {
        guard !nums.isEmpty else { return }

        var dict = [0: 0, 1: 0, 2: 0]
        for n in nums {
            dict[n]! += 1
        }

        for arrayIdx in stride(from: 0, to: nums.count, by: 1) {
            let dictIdx = (dict[0]! > 0) ? 0 : (dict[1]! > 0 ? 1 : 2)
            nums[arrayIdx] = dictIdx
            dict[dictIdx]! -= 1
        }
    }
}

// class Solution {
//     func sortColors(_ nums: inout [Int]) {
//         guard !nums.isEmpty else { return }
//         for (i, n) in nums.enumerated() {
//             var minIndex = i
//             for j in stride(from: i, to: nums.count, by: 1) {
//                 if nums[j] < nums[minIndex] {
//                     minIndex = j
//                 }
//             }
//             nums.swapAt(minIndex, i)
//         }
//     }
// }