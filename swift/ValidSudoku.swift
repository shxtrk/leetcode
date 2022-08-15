// https://leetcode.com/problems/valid-sudoku/

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: board.count)
        var cols = Array(repeating: Set<Character>(), count: board.count)
        var boxs = Array(repeating: Array(repeating: Set<Character>(),
                                          count: board.count / 3),
                         count: board.count / 3)
        
        for r in stride(from: 0, to: board.count, by: 1) {
            for c in stride(from: 0, to: board.count, by: 1) {
                let v = board[r][c]
                guard v != "." else { continue }
                
                if rows[r].contains(v) {
                    return false
                }
                rows[r].insert(v)
                
                if cols[c].contains(v) {
                    return false
                }
                cols[c].insert(v)
                
                if boxs[r / 3][c / 3].contains(v) {
                    return false
                }
                boxs[r / 3][c / 3].insert(v)
            }
        }
        
        return true
    }
}