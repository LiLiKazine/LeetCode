//: [Previous](@previous)

/*
 513. Find Bottom Left Tree Value
 中等
 Given the root of a binary tree, return the leftmost value in the last row of the tree.

  

 Example 1:


 Input: root = [2,1,3]
 Output: 1
 Example 2:


 Input: root = [1,2,3,4,null,5,6,null,null,7]
 Output: 7
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
 */

import Foundation

class Solution {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var queue: [TreeNode] = [root]
        var result: Int = 0
        while !queue.isEmpty {
            result = queue[0].val
            let size = queue.count
            for _ in 0..<size {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return result
    }
}

//: [Next](@next)
