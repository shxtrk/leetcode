// https://leetcode.com/problems/find-the-town-judge/

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        let trustsNobody = Array(1...n).filter { judge in
            !trust.contains { $0[0] == judge }
        }
        return trustsNobody.first { judge in
            trust.filter { $0[1] == judge }.count == n - 1
        } ?? -1
    }
}