// https://leetcode.com/problems/unique-paths-iii/

class Solution {
    func uniquePathsIII(_ grid: [[Int]]) -> Int {

        func initialize(_ grid: [[Int]]) -> ((Int, Int), Int) {
            var start: (Int, Int)!
            var squares = 0 
        
            for row in 0 ..< grid.count {
                for col in 0 ..< grid[row].count {
                    if grid[row][col] == 1 {
                        start = (row, col)
                    }
                    if grid[row][col] == 0 {
                        squares += 1 
                    }
                }
            }
        
            return (start, squares)
        }
    
        var (start, squares) = initialize(grid)
        var grid = grid 
        var paths = 0 
    
        func helper(_ curr: (Int, Int)) {
            if grid[curr.0][curr.1] == 2 {
                if squares == 0 {
                    paths += 1
                }
                return 
            }
    
            let val = grid[curr.0][curr.1]
            if val == 0 { squares -= 1 }
            grid[curr.0][curr.1] = -1
    
            for dir in 0 ..< 4 {
                var next: (Int, Int)!
    
                switch dir {
                case 0:
                    next = (curr.0 - 1, curr.1)
                case 1:
                    next = (curr.0, curr.1 + 1)
                case 2:
                    next = (curr.0 + 1, curr.1)
                case 3:
                    next = (curr.0, curr.1 - 1)
                default: 
                    break 
                }
    
                guard next.0 >= 0 && next.0 < grid.count &&
                    next.1 >= 0 && next.1 < grid[0].count &&
                    grid[next.0][next.1] != -1 else {
                    continue
                }
    
                helper(next)
            }
    
            if val == 0 { squares += 1 }
            grid[curr.0][curr.1] = val 
        }
    
        helper(start) 
        return paths
    }
}