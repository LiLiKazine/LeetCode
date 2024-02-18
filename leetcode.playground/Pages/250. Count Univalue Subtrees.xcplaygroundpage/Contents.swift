//: [Previous](@previous)

/*
 250. Count Univalue Subtrees
 中等
 Given the root of a binary tree, return the number of uni-value
 subtrees
 .

 A uni-value subtree means all nodes of the subtree have the same value.

  

 Example 1:


 Input: root = [5,1,5,5,5,null,5]
 Output: 4
 Example 2:

 Input: root = []
 Output: 0
 Example 3:

 Input: root = [5,5,5,5,5,null,5]
 Output: 6
  

 Constraints:

 The number of the node in the tree will be in the range [0, 1000].
 -1000 <= Node.val <= 1000
 
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func countUnivalSubtrees(_ root: TreeNode?) -> Int {
        let (ans, _) = cnt(root)
        return ans
    }
    
    func cnt(_ node: TreeNode?) -> (Int, Bool) {
        guard let node else { return (0, true) }
        
        if node.left == nil && node.right == nil {
            return (1, true)
        }
        let left = cnt(node.left)
        let right = cnt(node.right)
        if left.1 && right.1 && (node.left == nil || node.val == node.left?.val) && (node.right == nil || node.val == node.right?.val) {
            return (left.0 + right.0 + 1, true)
        }
        return (left.0 + right.0, false)
    }
}

//: [Next](@next)
