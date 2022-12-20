// https://leetcode.com/problems/keys-and-rooms/

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var keyChain = Set<Int>(rooms[0])
        var unvisitedRooms = Set<Int>()
        (1..<rooms.count).forEach { unvisitedRooms.insert($0) }
        
        while !keyChain.isEmpty {
            let key = keyChain.removeFirst()
            unvisitedRooms.remove(key)
            rooms[key].forEach {
                if unvisitedRooms.contains($0) {
                    keyChain.insert($0)
                }
            }
        }

        return unvisitedRooms.isEmpty
    }
}