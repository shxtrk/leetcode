// https://leetcode.com/problems/snakes-and-ladders/

class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        var intToPos = [0]
        var direction = true

        for i in stride(from: n - 1, to: -1, by: -1) {
            if direction {
                intToPos.append(contentsOf: board[i])
            } else {
                intToPos.append(contentsOf: board[i].reversed())
            }

            direction.toggle()
        }

        var queue = [[1, 0]]
        var visited = Set<Int>()

        while !queue.isEmpty {
            let current = queue.remove(at: 0)
            let square = current[0]
            let moves = current[1]

            for i in 1...6 {
                var nextSquare = square + i

                if intToPos[nextSquare] != -1 {
                    nextSquare = intToPos[nextSquare]
                }

                if nextSquare == n * n {
                    return moves + 1
                }

                if !visited.contains(nextSquare) {
                    visited.insert(nextSquare)
                    queue.append([nextSquare, moves + 1])
                }
            }
        }

        return -1
    }
}