//: [Previous](@previous)

/*
 
 897. Increasing Order Search Tree
 
 Given a binary search tree, rearrange the tree in in-order so that the leftmost node in the tree is now the root of the tree, and every node has no left child and only 1 right child.

 Example 1:
 Input: [5,3,6,2,4,null,8,1,null,null,null,7,9]

        5
       / \
     3    6
    / \    \
   2   4    8
  /        / \
 1        7   9

 Output: [1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]

  1
   \
    2
     \
      3
       \
        4
         \
          5
           \
            6
             \
              7
               \
                8
                 \
                  9
  

 Constraints:

 The number of nodes in the given tree will be between 1 and 100.
 Each node will have a unique integer value from 0 to 1000.
 
 */

import Foundation

class Solution {
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        
        func dfs(_ p: TreeNode?) -> (TreeNode?, TreeNode?) {
            guard let p else { return (nil, nil) }
            let (lmin, lmax) = dfs(p.left)
            lmax?.right = p
            let (rmin, rmax) = dfs(p.right)
            p.left = nil
            p.right = rmin
            return (lmin ?? p, rmax ?? p)
        }
        
        let (ans, _) = dfs(root)
        return ans
    }
}

//: [Next](@next)
