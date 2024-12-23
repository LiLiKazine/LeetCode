//: [Previous](@previous)

/*
 1305. All Elements in Two Binary Search Trees
 中等
 Given two binary search trees root1 and root2, return a list containing all the integers from both trees sorted in ascending order.

  

 Example 1:


 Input: root1 = [2,1,4], root2 = [1,0,3]
 Output: [0,1,1,2,3,4]
 Example 2:


 Input: root1 = [1,null,8], root2 = [8,1]
 Output: [1,1,8,8]
  

 Constraints:

 The number of nodes in each tree is in the range [0, 5000].
 -105 <= Node.val <= 105
 */

import Foundation

class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var ans = [Int]()
        func flat(_ p: TreeNode?) {
            guard let p else { return }
            flat(p.left)
            ans.append(p.val)
            flat(p.right)
        }
        var i = 0
        func dfs(_ p: TreeNode?) {
            guard let p else { return }
            dfs(p.left)
            while i < ans.count && ans[i] < p.val {
                i += 1
            }
            if i == ans.count {
                ans.append(p.val)
            } else {
                ans.insert(p.val, at: i)
            }
            dfs(p.right)
        }
        
        flat(root1)
        dfs(root2)
        return ans
    }
}

//: [Next](@next)
