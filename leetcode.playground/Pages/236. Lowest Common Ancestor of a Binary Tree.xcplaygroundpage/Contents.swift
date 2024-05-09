//: [Previous](@previous)

/*
 236. Lowest Common Ancestor of a Binary Tree
 中等
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 Example 2:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
 Example 3:

 Input: root = [1,2], p = 1, q = 2
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [2, 105].
 -109 <= Node.val <= 109
 All Node.val are unique.
 p != q
 p and q will exist in the tree.
 
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
    
    var routeP = [TreeNode]()
    var routeQ = [TreeNode]()
    
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root, let p, let q else { return nil }
        dfs([root], p, q)
        
        var ans: TreeNode?
        
        while routeP.first?.val == routeQ.first?.val {
            ans = routeP.removeFirst()
            routeQ.removeFirst()
        }
        return ans
    }
    
    private func dfs(_ current: [TreeNode], _ p: TreeNode, _ q: TreeNode) {
        guard let last = current.last else {
            return
        }
        if last.val == p.val {
            routeP = current
        }
        if last.val == q.val {
            routeQ = current
        }
        if routeP.count > 0 && routeQ.count > 0 {
            return
        }
        if let left = last.left {
            dfs(current + [left], p, q)
        }
        if let right = last.right {
            dfs(current + [right], p, q)
        }
    }
    
}

/*

 class Solution {
     func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
         guard let node = root else { return nil }
         if node === p || node === q { return node }
         let r = lowestCommonAncestor(node.right, p, q)
         let l = lowestCommonAncestor(node.left, p, q)
         if r == nil && l == nil {
             return nil
         } else if r == nil {
             return l
         } else if l == nil {
             return r
         } else {
             return node
         }
     }
 }
 */

//: [Next](@next)
