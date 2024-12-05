//: [Previous](@previous)

/*
 965. Univalued Binary Tree
 简单
 A binary tree is uni-valued if every node in the tree has the same value.

 Given the root of a binary tree, return true if the given tree is uni-valued, or false otherwise.

  

 Example 1:


 Input: root = [1,1,1,1,1,null,1]
 Output: true
 Example 2:


 Input: root = [2,2,2,5,2]
 Output: false
  

 Constraints:

 The number of nodes in the tree is in the range [1, 100].
 0 <= Node.val < 100
 */

import Foundation

class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root else {
            return true
        }
        if let left = root.left, left.val != root.val {
            return false
        }
        if let right = root.right, right.val != root.val {
            return false
        }
        return isUnivalTree(root.left) && isUnivalTree(root.right)
    }
}

//: [Next](@next)
