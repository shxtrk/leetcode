// https://leetcode.com/problems/same-tree/

class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard p != nil && q != nil else { return p?.val == q?.val }
        
        var pStack = [p!]
        var qStack = [q!]

        while !pStack.isEmpty && !qStack.isEmpty {
            let pCurr = pStack.removeLast()
            let qCurr = qStack.removeLast()

            guard pCurr.val == qCurr.val else { return false }

            if pCurr.right != nil && qCurr.right != nil {
                pStack.append(pCurr.right!)
                qStack.append(qCurr.right!)
            } else if !(pCurr.right == nil && qCurr.right == nil) {
                return false
            }

            if pCurr.left != nil && qCurr.left != nil {
                pStack.append(pCurr.left!)
                qStack.append(qCurr.left!)
            } else if !(pCurr.left == nil && qCurr.left == nil) {
                return false
            }
        }

        return pStack.isEmpty && qStack.isEmpty
    }
}