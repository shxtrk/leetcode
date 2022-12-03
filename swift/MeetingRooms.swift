// https://leetcode.com/problems/meeting-rooms/

class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        let ivs = intervals.sorted { $0[0] < $1[0] }
        for i in stride(from: 0, to: ivs.count - 1, by: 1) {
            if ivs[i][1] > ivs[i + 1][0] {
                return false
            }
        }
        return true
    }
}