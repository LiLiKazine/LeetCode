//: [Previous](@previous)

/*
 572. Subtree of Another Tree
 简单
 Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

 A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.

  

 Example 1:


 Input: root = [3,4,5,1,2], subRoot = [4,1,2]
 Output: true
 Example 2:


 Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
 Output: false
  

 Constraints:

 The number of nodes in the root tree is in the range [1, 2000].
 The number of nodes in the subRoot tree is in the range [1, 1000].
 -104 <= root.val <= 104
 -104 <= subRoot.val <= 104
 */

import Foundation


class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        func height(_ p: TreeNode?) -> Int {
            guard let p else { return 0 }
            return max(height(p.left), height(p.right)) + 1
        }
        let h = height(subRoot)
        if h == 0 {
            return true
        }
        
        func compare(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            guard let p, let q else { return p === q }
            return p.val == q.val && compare(p.left, q.left) && compare(p.right, q.right)
        }
        
        func dfs(_ p: TreeNode?) -> (Int, Bool) {
            guard let p else { return (0, false) }
            let (hl, fl) = dfs(p.left)
            let (hr, fr) = dfs(p.right)
            if fl || fr {
                return (0, true)
            }
            if max(hl, hr) + 1 == h {
                return (h, compare(p, subRoot))
            }
            return (max(hl, hr) + 1, false)
        }
        
        return dfs(root).1
    }
}

//: [Next](@next)
