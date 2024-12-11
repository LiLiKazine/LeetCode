//: [Previous](@previous)

/*
 663. Equal Tree Partition
 中等
 Given the root of a binary tree, return true if you can partition the tree into two trees with equal sums of values after removing exactly one edge on the original tree.

  

 Example 1:


 Input: root = [5,10,10,null,null,2,3]
 Output: true
 Example 2:


 Input: root = [1,2,10,null,null,2,20]
 Output: false
 Explanation: You cannot split the tree into two trees with equal sums after removing exactly one edge on the tree.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105
 */

import Foundation

class Solution {
    func checkEqualTree(_ root: TreeNode?) -> Bool {
        
        func sum(_ p: TreeNode?) -> Int {
            guard let p else { return 0 }
            return p.val + sum(p.left) + sum(p.right)
        }
        
        let total = sum(root)
        
        func dfs(_ p: TreeNode?) -> (Int, Bool) {
            guard let p else { return (0, false) }
            var sum = 0
            if let left = p.left {
                let (lc, ls) = dfs(left)
                if ls {
                    return (0, true)
                }
                if total == lc * 2 {
                    return (0, true)
                }
                sum += lc
            }
            if let right = p.right {
                let (rc, rs) = dfs(right)
                if rs {
                    return (0, true)
                }
                if total == rc * 2 {
                    return (0, true)
                }
                sum += rc
            }
            return (sum + p.val, false)
        }
        return dfs(root).1
    }
}

//: [Next](@next)
