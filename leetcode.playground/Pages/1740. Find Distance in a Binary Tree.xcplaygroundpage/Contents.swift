//: [Previous](@previous)

/*
 1740. Find Distance in a Binary Tree
 中等
 Given the root of a binary tree and two integers p and q, return the distance between the nodes of value p and value q in the tree.

 The distance between two nodes is the number of edges on the path from one to the other.

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 0
 Output: 3
 Explanation: There are 3 edges between 5 and 0: 5-3-1-0.
 Example 2:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 7
 Output: 2
 Explanation: There are 2 edges between 5 and 7: 5-2-7.
 Example 3:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 5
 Output: 0
 Explanation: The distance between a node and itself is 0.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 109
 All Node.val are unique.
 p and q are values in the tree.
 */

import Foundation

class Solution {
    func findDistance(_ root: TreeNode?, _ p: Int, _ q: Int) -> Int {
        
        var len = 0, common = Int.max, plen = -1, qlen = -1
        func dfs(_ n: TreeNode?) -> Bool {
            guard let n else { return false }
            var res = false
            if n.val == p {
                plen = len
                common = min(common, len)
                res = true
            }
            if n.val == q {
                qlen = len
                common = min(common, len)
                res = true
            }
            len += 1
            let l = dfs(n.left)
            let r = dfs(n.right)
            len -= 1
            if l && r {
                common = min(common, len)
            }
            return res || l || r
        }
        dfs(root)
        print(plen, qlen, common)
        return plen + qlen - common * 2
    }
}

//: [Next](@next)
