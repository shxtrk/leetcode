// https://leetcode.com/problems/number-of-nodes-in-the-sub-tree-with-the-same-label/

class Solution {
    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        var tree = [Int: [Int]]()
        for edge in edges {
            tree[edge[0], default: [Int]()].append(edge[1])
            tree[edge[1], default: [Int]()].append(edge[0])
        }

        let labels = Array(labels)
        var result = [Int](repeating: 0, count: n)

        func traverse(_ node: Int, _ parent: Int) -> [Character: Int] {
            var labelsFrequency = [Character: Int]()
            for child in tree[node]! {
                if child != parent {
                    let subtreeLabelsFrequency = traverse(child, node)
                    labelsFrequency.merge(subtreeLabelsFrequency, uniquingKeysWith: { $0 + $1 })
                }
            }
            labelsFrequency[labels[node], default: 0] += 1
            result[node] = labelsFrequency[labels[node]]!
            return labelsFrequency
        }
        traverse(0, -1)

        return result
    }
}