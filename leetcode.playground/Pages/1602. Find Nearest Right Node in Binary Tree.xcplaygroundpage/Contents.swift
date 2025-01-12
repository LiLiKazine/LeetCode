//: [Previous](@previous)

/*
 1602. Find Nearest Right Node in Binary Tree
 中等
 Given the root of a binary tree and a node u in the tree, return the nearest node on the same level that is to the right of u, or return null if u is the rightmost node in its level.

  

 Example 1:


 Input: root = [1,2,3,null,4,5,6], u = 4
 Output: 5
 Explanation: The nearest node on the same level to the right of node 4 is node 5.
 Example 2:


 Input: root = [3,null,4,2], u = 2
 Output: null
 Explanation: There are no nodes to the right of 2.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 105].
 1 <= Node.val <= 105
 All values in the tree are distinct.
 u is a node in the binary tree rooted at root.
 */

import Foundation

class Solution {
    func findNearestRightNode(_ root: TreeNode?, _ u: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var queue: [TreeNode] = [root]
        while queue.count > 0 {
            let size = queue.count
            for i in 0..<size {
                let node = queue.removeFirst()
                if node === u {
                    if i < size - 1 {
                        return queue[0]
                    } else {
                        return nil
                    }
                }
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
        }
        return nil
    }
}

//: [Next](@next)
