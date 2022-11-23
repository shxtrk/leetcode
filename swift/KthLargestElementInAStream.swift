// https://leetcode.com/problems/kth-largest-element-in-a-stream/

class KthLargest {

    private var root: Node? = nil
    private let k: Int

    init(_ k: Int, _ nums: [Int]) {
        for i in 0..<nums.count {
            root = Self.insert(nums[i], to: root)
        }
        self.k = k
    }
    
    func add(_ val: Int) -> Int {
        root = Self.insert(val, to: root)
        return searchKth(root!, k)
    }

    private static func insert(_ val: Int, to root: Node?) -> Node {
        guard let root = root else { return Node(value: val) }
        
        if val < root.value {
            root.left = insert(val, to: root.left)
        } else { 
            root.right = insert(val, to: root.right)
        }

        root.count += 1
        return root
    }

    private func searchKth(_ root: Node, _ k: Int) -> Int {
        let rightCount = root.right != nil ? root.right!.count : 0
        if rightCount + 1 == k {
            return root.value
        } else if k <= rightCount  {
            return searchKth(root.right!, k)
        } else {
            return searchKth(root.left!, k - rightCount - 1)
        }
    }

    private class Node {
        var value: Int
        var count: Int
        var left: Node?
        var right: Node?

        init(value: Int, count: Int = 1, left: Node? = nil, right: Node? = nil) {
            self.value = value
            self.count = count
            self.left = left
            self.right = right
        }
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */