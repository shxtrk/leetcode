// https://leetcode.com/problems/best-team-with-no-conflicts/

class Solution {
    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        let c = min(scores.count, ages.count), indexes = Array(0..<c).sorted(by: { ages[$0] > ages[$1] || ages[$0] == ages[$1] && scores[$0] > scores[$1] })
        var dp = [Int](repeating: 0, count: c)
        for i in 0..<c {
            let score = scores[indexes[i]]
            dp[i] = score
            for j in 0..<i where scores[indexes[j]] >= score {
                dp[i] = max(dp[i], dp[j] + score)
            }
        }
        return dp.max()!
    }
}