// https://leetcode.com/problems/max-points-on-a-line/

class Solution {

    struct Point {
        let x: Double
        let y: Double
    }

    func colinear(p1: Point, p2: Point, p3: Point) -> Bool {
        let slope1 = (p1.x - p2.x) == 0 ? Double.infinity : (p1.y - p2.y) / (p1.x - p2.x)
        let slope2 = (p1.x - p3.x) == 0 ? Double.infinity : (p1.y - p3.y) / (p1.x - p3.x)
        return slope1 == slope2
    }

    func maxPoints(_ points: [[Int]]) -> Int {
        let points = points.map { Point(x: Double($0[0]), y: Double($0[1])) }
        var linesByRank = [Int: [[Point]]]()

        for point in points {
            var newLinesByRank = linesByRank
            for (rank, rankArray) in linesByRank {
                for line in rankArray {
                    if rank == 0 {
                        var line = line
                        line.append(point)
                        newLinesByRank[1, default: []].append(line)
                    } else {
                        if colinear(p1: line[0], p2: line[1], p3: point) {
                            var line = line
                            line.append(point)
                            newLinesByRank[rank + 1, default: []].append(line)
                        }
                    }
                }
            }
            newLinesByRank[0, default: []].append([point])
            linesByRank = newLinesByRank
        }
        return linesByRank.count
    }
}