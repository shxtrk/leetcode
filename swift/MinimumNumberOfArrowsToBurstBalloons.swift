// https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        var sorted = points.sorted { $0[0] > $1[0] }
        var arrows = 1
        var tmp: [[Int]] = [sorted.removeLast()]

        while !sorted.isEmpty {
            let current = sorted.removeLast()
            var bursting = true
            for t in tmp {
                if current[0] > t[1] {
                    bursting = false
                }
            }
            if bursting {
                tmp.append(current)
            } else {
                tmp = [current]
                arrows += 1
            }
        }

        return arrows
    }
}