//: [Previous](@previous)

/*
 958. Check Completeness of a Binary Tree
 中等
 Given the root of a binary tree, determine if it is a complete binary tree.

 In a complete binary tree, every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

  

 Example 1:


 Input: root = [1,2,3,4,5,6]
 Output: true
 Explanation: Every level before the last is full (ie. levels with node-values {1} and {2, 3}), and all nodes in the last level ({4, 5, 6}) are as far left as possible.
 Example 2:


 Input: root = [1,2,3,4,5,null,7]
 Output: false
 Explanation: The node with value 7 isn't as far left as possible.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 100].
 1 <= Node.val <= 1000
 */

import Foundation

class Solution {
    func isCompleteTree(_ root: TreeNode?) -> Bool {
        guard let root else { return true }
        var queue = [root], reachLast = false
        
        while queue.count > 0 {
            var next = [TreeNode](), notFull = false
            for node in queue {
                if let left = node.left {
                    if notFull {
                        return false
                    }
                    next.append(left)
                } else {
                    notFull = true
                }
                if let right = node.right {
                    if notFull {
                        return false
                    }
                    next.append(right)
                } else {
                    notFull = true
                }
            }
            if reachLast && next.count > 0 {
                return false
            }
            if next.count != queue.count * 2 {
                reachLast = true
            }
            queue = next
        }
        return true
    }
}

//: [Next](@next)
