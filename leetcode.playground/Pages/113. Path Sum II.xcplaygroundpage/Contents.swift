//: [Previous](@previous)

/*
 113. Path Sum II
 中等
 Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum. Each path should be returned as a list of the node values, not node references.

 A root-to-leaf path is a path starting from the root and ending at any leaf node. A leaf is a node with no children.

  

 Example 1:


 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: [[5,4,11,2],[5,8,4,5]]
 Explanation: There are two paths whose sum equals targetSum:
 5 + 4 + 11 + 2 = 22
 5 + 8 + 4 + 5 = 22
 Example 2:


 Input: root = [1,2,3], targetSum = 5
 Output: []
 Example 3:

 Input: root = [1,2], targetSum = 0
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 5000].
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
 
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
    
    var ans = [[Int]]()
    var route = [Int]()
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root else { return [] }
        pathSum(root, targetSum - root.val)
        return ans
    }
    
    func pathSum(_ node: TreeNode, _ targetSum: Int) {
        route.append(node.val)
        if targetSum == 0 && node.left == nil && node.right == nil {
            if route.count > 0 {
                ans.append(route)
            }
        }
        if let left = node.left {
            pathSum(left, targetSum - left.val)
        }
        if let right = node.right {
            pathSum(right, targetSum - right.val)
        }
        route.popLast()
    }
}

//: [Next](@next)
