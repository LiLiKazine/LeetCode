//: [Previous](@previous)

/*
 1120. Maximum Average Subtree
 中等
 Given the root of a binary tree, return the maximum average value of a subtree of that tree. Answers within 10-5 of the actual answer will be accepted.

 A subtree of a tree is any node of that tree plus all its descendants.

 The average value of a tree is the sum of its values, divided by the number of nodes.

  

 Example 1:


 Input: root = [5,6,1]
 Output: 6.00000
 Explanation:
 For the node with value = 5 we have an average of (5 + 6 + 1) / 3 = 4.
 For the node with value = 6 we have an average of 6 / 1 = 6.
 For the node with value = 1 we have an average of 1 / 1 = 1.
 So the answer is 6 which is the maximum.
 Example 2:

 Input: root = [0,null,1]
 Output: 1.00000
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 105
 
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
    func maximumAverageSubtree(_ root: TreeNode?) -> Double {
        let (_, _, ans) = cnt(root)
        return ans
    }
    
    func cnt(_ node: TreeNode?) -> (Int, Int, Double) {
        guard let node else { return (0, 0, 0) }
        let (v1, c1, a1) = cnt(node.left)
        let (v2, c2, a2) = cnt(node.right)
        let val = node.val + v1 + v2
        let c = c1 + c2 + 1
        let ans = Double(val) / Double(c)
        return (val, c, max(ans, a1, a2))
    }
}


//: [Next](@next)
