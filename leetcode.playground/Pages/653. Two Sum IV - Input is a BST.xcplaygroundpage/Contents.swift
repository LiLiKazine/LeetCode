//: [Previous](@previous)

/*
 653. Two Sum IV - Input is a BST
 简单
 Given the root of a binary search tree and an integer k, return true if there exist two elements in the BST such that their sum is equal to k, or false otherwise.

  

 Example 1:


 Input: root = [5,3,6,2,4,null,7], k = 9
 Output: true
 Example 2:


 Input: root = [5,3,6,2,4,null,7], k = 28
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -104 <= Node.val <= 104
 root is guaranteed to be a valid binary search tree.
 -105 <= k <= 105
 */

import Foundation

class Solution {
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        var set = Set<Int>()
        
        func dfs(_ p: TreeNode?) -> Bool {
            guard let p else { return false }
            if set.contains(k - p.val) { return true }
            set.insert(p.val)
            return dfs(p.left) || dfs(p.right)
        }
        
        return dfs(root)
    }
}

//: [Next](@next)
