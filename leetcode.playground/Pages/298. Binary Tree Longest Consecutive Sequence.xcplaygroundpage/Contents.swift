//: [Previous](@previous)

/*
 298. Binary Tree Longest Consecutive Sequence
 中等
 Given the root of a binary tree, return the length of the longest consecutive sequence path.

 A consecutive sequence path is a path where the values increase by one along the path.

 Note that the path can start at any node in the tree, and you cannot go from a node to its parent in the path.

  

 Example 1:


 Input: root = [1,null,3,2,4,null,null,null,5]
 Output: 3
 Explanation: Longest consecutive sequence path is 3-4-5, so return 3.
 Example 2:


 Input: root = [2,null,3,2,null,1]
 Output: 2
 Explanation: Longest consecutive sequence path is 2-3, not 3-2-1, so return 2.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3 * 104].
 -3 * 104 <= Node.val <= 3 * 104
 
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
    func longestConsecutive(_ root: TreeNode?) -> Int {
        var ans = 0
        
        func dfs(_ node: TreeNode?, _ len: Int) {
            guard let node else { return }
            let len = len + 1
            ans = max(ans, len)
            if let left = node.left {
                dfs(left, left.val == node.val + 1 ? len : 0)
            }
            if let right = node.right {
                dfs(right, right.val == node.val + 1 ? len : 0)
            }
        }
        
        dfs(root, 0)
        return ans
    }
    
}


//: [Next](@next)
