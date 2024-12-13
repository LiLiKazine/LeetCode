//: [Previous](@previous)

/*
 814. Binary Tree Pruning
 中等
 Given the root of a binary tree, return the same tree where every subtree (of the given tree) not containing a 1 has been removed.

 A subtree of a node node is node plus every node that is a descendant of node.

  

 Example 1:


 Input: root = [1,null,0,0,1]
 Output: [1,null,0,null,1]
 Explanation:
 Only the red nodes satisfy the property "every subtree not containing a 1".
 The diagram on the right represents the answer.
 Example 2:


 Input: root = [1,0,1,0,0,0,1]
 Output: [1,null,1,null,1]
 Example 3:


 Input: root = [1,1,0,1,1,0,1,0]
 Output: [1,1,0,1,1,null,1]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 200].
 Node.val is either 0 or 1.
 */

import Foundation


class Solution {
    func pruneTree(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ p: TreeNode?) -> Bool {
            guard let p else { return false }
            let left = dfs(p.left), right = dfs(p.right)
            
            if !left {
                p.left = nil
            }
            if !right {
                p.right = nil
            }
            
            return left || right || p.val == 1
        }
        
        return dfs(root) ? root : nil
    }
}

//: [Next](@next)
