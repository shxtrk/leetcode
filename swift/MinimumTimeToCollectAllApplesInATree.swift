// https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/

class Solution {
    func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
        var tree = [Int: [Int]]()
        for edge in edges {
            tree[edge[0], default: [Int]()].append(edge[1])
            tree[edge[1], default: [Int]()].append(edge[0])
        }

        func traverse(_ node: Int, _ parent: Int) -> Int {
            let secondForCurrentNode = node == 0 ? 0 : 2
            var secondForChildren = 0

            let children = tree[node]!
            if children.count == 1 && children[0] == parent {
                return hasApple[node] ? secondForCurrentNode : 0
            }
            
            for child in children {
                if child != parent {
                    secondForChildren += traverse(child, node)
                }
            }

            if secondForChildren > 0 {
                return secondForChildren + secondForCurrentNode
            } else {
                return hasApple[node] ? secondForCurrentNode : 0
            }
        }

        return traverse(0, -1)
    }
}