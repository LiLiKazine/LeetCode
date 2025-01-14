//: [Previous](@previous)

/*
 114. Flatten Binary Tree to Linked List
 中等
 Given the root of a binary tree, flatten the tree into a "linked list":

 The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
 The "linked list" should be in the same order as a pre-order traversal of the binary tree.
  

 Example 1:


 Input: root = [1,2,5,3,4,null,6]
 Output: [1,null,2,null,3,null,4,null,5,null,6]
 Example 2:

 Input: root = []
 Output: []
 Example 3:

 Input: root = [0]
 Output: [0]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
  

 Follow up: Can you flatten the tree in-place (with O(1) extra space)?

 */

import Foundation

class Solution {
    func flatten(_ root: TreeNode?) {
        func preorder(_ node: TreeNode?) -> (TreeNode,  TreeNode)? {
            guard let node else { return nil }
            let left = node.left, right = node.right
            if left == nil && right == nil {
                return (node, node)
            }
            node.left = nil
            var cur = node
            if let (head, tail) = preorder(left) {
                cur.right = head
                cur = tail
            }
            if let (head, tail) = preorder(right) {
                cur.right = head
                cur = tail
            }
            return (node, cur)
        }
        preorder(root)
    }
}

//: [Next](@next)
