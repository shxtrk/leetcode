// https://leetcode.com/problems/last-stone-weight/

class Solution {

    func lastStoneWeight(_ stones: [Int]) -> Int {
        var stones = stones

        for i in stride(from: stones.count / 2, through: 0, by: -1) {
            siftDown(&stones, i)
        }
        
        while stones.count > 1 {
            let s = stones.first!
            stones[0] = stones.removeLast()
            siftDown(&stones, 0)

            if s - stones[0] == 0 {
                let l = stones.removeLast()
                if !stones.isEmpty {
                    stones[0] = l
                }
                siftDown(&stones, 0)
            } else {
                stones[0] = s - stones[0]
                siftDown(&stones, 0)
            }
        }
        return stones.first ?? 0
    }

    func siftDown(_ stones: inout [Int], _ i: Int) {
        let left = i * 2 + 1
        let right = i * 2 + 2

        var max = i

        if left < stones.count, stones[left] > stones[i] {
            max = left
        }
        if right < stones.count, stones[max] < stones[right] {
            max = right
        }
        
        guard i != max else { return }
        stones.swapAt(max, i)
        siftDown(&stones, max)
    }
}