// https://leetcode.com/problems/minimum-rounds-to-complete-all-tasks/

class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var dict = [Int: Int]()

        for task in tasks {
            dict[task, default: 0] += 1
        }

        var taskCounts = Array(dict.values)

        var rounds = 0
        while !taskCounts.isEmpty {
            var count = taskCounts.removeLast()
            while count >= 5 {
                count -= 3
                rounds += 1
            }

            switch count {
                case 5, 4: rounds += 2
                case 3, 2: rounds += 1
                default: return -1
            }
        }

        return rounds
    }
}