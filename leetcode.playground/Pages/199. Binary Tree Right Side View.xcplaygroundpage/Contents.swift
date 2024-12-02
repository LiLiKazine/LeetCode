//: [Previous](@previous)

/*
 
 199. Binary Tree Right Side View
 
 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Example:

 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---

 
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var ans = [Int]()
        
        func dfs(_ node: TreeNode?, _ depth: Int) {
            guard let node else {
                return
            }
            if ans.count == depth {
                ans.append(node.val)
            } else {
                ans[depth] = node.val
            }
            dfs(node.left, depth + 1)
            dfs(node.right, depth + 1)
        }
        dfs(root, 0)
        return ans
    }
}

//: [Next](@next)
