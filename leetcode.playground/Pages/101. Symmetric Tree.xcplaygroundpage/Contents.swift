//: [Previous](@previous)

/*
 101. Symmetric Tree
 简单
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).

  

 Example 1:


 Input: root = [1,2,2,3,4,4,3]
 Output: true
 Example 2:


 Input: root = [1,2,2,null,3,null,3]
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 -100 <= Node.val <= 100
  

 Follow up: Could you solve it both recursively and iteratively?

 */

import Foundation

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
    
        func dfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            guard let p, let q else {
                return p == nil && q == nil
            }
            return p.val == q.val && dfs(p.left, q.right) && dfs(p.right, q.left)
        }
        
        return dfs(root?.left, root?.right)
    }
}

//: [Next](@next)
