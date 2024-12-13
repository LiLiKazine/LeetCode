//: [Previous](@previous)

/*
 1110. Delete Nodes And Return Forest
 中等
 Given the root of a binary tree, each node in the tree has a distinct value.

 After deleting all nodes with a value in to_delete, we are left with a forest (a disjoint union of trees).

 Return the roots of the trees in the remaining forest. You may return the result in any order.

  

 Example 1:


 Input: root = [1,2,3,4,5,6,7], to_delete = [3,5]
 Output: [[1,2,null,4],[6],[7]]
 Example 2:

 Input: root = [1,2,4,null,3], to_delete = [3]
 Output: [[1,2,4]]
  

 Constraints:

 The number of nodes in the given tree is at most 1000.
 Each node has a distinct value between 1 and 1000.
 to_delete.length <= 1000
 to_delete contains distinct values between 1 and 1000.
 */

import Foundation

class Solution {
    func delNodes(_ root: TreeNode?, _ to_delete: [Int]) -> [TreeNode?] {
        var ans = [TreeNode?](), set = Set(to_delete)
        set.insert(0)
        func dfs(_ p: TreeNode?, _ father: TreeNode? = nil) {
            guard let p else { return }
            
            dfs(p.left, p)
            dfs(p.right, p)
            
            guard set.contains(p.val) else {
                return
            }
            if p === father?.left {
                father?.left = nil
            }
            if p === father?.right {
                father?.right = nil
            }
            if let left = p.left {
                ans.append(left)
                p.left = nil
            }
            if let right = p.right {
                ans.append(right)
                p.right = nil
            }
        }
        let dummy = TreeNode(0)
        dummy.left = root
        dfs(dummy)
        return ans
    }
}

//: [Next](@next)
