// https://leetcode.com/problems/pascals-triangle-ii/

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        var result = [Int]()
        
        for i in stride(from: 0, to: rowIndex + 1, by: 1) {
            result.append(1)
            for j in stride(from: i - 1, to: 0, by: -1) {
                result[j] = result[j] + result[j - 1]
            }
        }
        
        return result
    }
}