//: [Previous](@previous)

/*
 107. Binary Tree Level Order Traversal II
 中等
 Given the root of a binary tree, return the bottom-up level order traversal of its nodes' values. (i.e., from left to right, level by level from leaf to root).

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: [[15,7],[9,20],[3]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 */

import Foundation

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        var ans = [[Int]](), queue = [root]
        
        while queue.count > 0 {
            var vals: [Int] = []
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                vals.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            ans.insert(vals, at: 0)
        }
        return ans
    }
}


//: [Next](@next)
