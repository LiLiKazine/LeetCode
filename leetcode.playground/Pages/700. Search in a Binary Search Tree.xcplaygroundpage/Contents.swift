//: [Previous](@previous)

/*
 700. Search in a Binary Search Tree
 简单
 You are given the root of a binary search tree (BST) and an integer val.

 Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.

  

 Example 1:


 Input: root = [4,2,7,1,3], val = 2
 Output: [2,1,3]
 Example 2:


 Input: root = [4,2,7,1,3], val = 5
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [1, 5000].
 1 <= Node.val <= 107
 root is a binary search tree.
 1 <= val <= 107
 */

import Foundation

class Solution {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        
        func dfs(_ p: TreeNode?) -> TreeNode? {
            guard let p else { return nil }
            if p.val == val { return p }
            if p.val < val { return dfs(p.right) }
            return dfs(p.left)
        }
        
        return dfs(root)
    }
}

//: [Next](@next)
