//: [Previous](@previous)

/*
 437. Path Sum III
 中等
 Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.

 The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).

  

 Example 1:


 Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
 Output: 3
 Explanation: The paths that sum to 8 are shown.
 Example 2:

 Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
 Output: 3
  

 Constraints:

 The number of nodes in the tree is in the range [0, 1000].
 -109 <= Node.val <= 109
 -1000 <= targetSum <= 1000
 */

import Foundation

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var ans : Int = 0
        
        var cnt = [0: 1]
        func dfs(_ p: TreeNode?, _ s: Int) {
            guard let p else { return }
            let s = s + p.val
            ans += cnt[s - targetSum, default: 0]
            cnt[s, default: 0] += 1
            dfs(p.left, s)
            dfs(p.right, s)
            cnt[s, default: 0] -= 1
        }
        dfs(root, 0)
        return ans
    }
}

//: [Next](@next)
