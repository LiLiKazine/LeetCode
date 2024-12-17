//: [Previous](@previous)

/*
 257. Binary Tree Paths
 简单
 Given the root of a binary tree, return all root-to-leaf paths in any order.

 A leaf is a node with no children.

  

 Example 1:


 Input: root = [1,2,3,null,5]
 Output: ["1->2->5","1->3"]
 Example 2:

 Input: root = [1]
 Output: ["1"]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 100].
 -100 <= Node.val <= 100
 */

import Foundation

class Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var ans = [String]()
        
        func dfs(_ p: TreeNode?, _ pre: String) {
            guard let p else { return }
            let str = pre.isEmpty ? String(p.val) : "\(pre)->\(p.val)"
            if p.left == nil && p.right == nil { ans.append(str) }
            dfs(p.left, str)
            dfs(p.right, str)
        }
        dfs(root, "")
        return ans
    }
}

//: [Next](@next)
