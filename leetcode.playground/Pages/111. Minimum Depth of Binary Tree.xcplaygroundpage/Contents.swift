//: [Previous](@previous)

/*
 111. Minimum Depth of Binary Tree
 简单
 Given a binary tree, find its minimum depth.

 The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.

 Note: A leaf is a node with no children.

  

 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 2
 Example 2:

 Input: root = [2,null,3,null,4,null,5,null,6]
 Output: 5
  

 Constraints:

 The number of nodes in the tree is in the range [0, 105].
 -1000 <= Node.val <= 1000
 */

import Foundation


class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else {
                return Int.max
            }
            if node.left == nil && node.right == nil {
                return 1
            }
            let l = dfs(node.left)
            let r = dfs(node.right)
            
            return min(l, r) + 1
        }
        let ans = dfs(root)
        return ans == Int.max ? 0 : ans
    }
}

//: [Next](@next)
