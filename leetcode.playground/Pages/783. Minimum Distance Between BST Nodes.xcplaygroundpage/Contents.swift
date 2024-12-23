//: [Previous](@previous)

/*
 
 783. Minimum Distance Between BST Nodes
 
 Given the root of a Binary Search Tree (BST), return the minimum difference between the values of any two different nodes in the tree.

 Note: This question is the same as 530: https://leetcode.com/problems/minimum-absolute-difference-in-bst/

  

 Example 1:


 Input: root = [4,2,6,1,3]
 Output: 1
 Example 2:


 Input: root = [1,0,48,null,null,12,49]
 Output: 1
  

 Constraints:

 The number of nodes in the tree is in the range [2, 100].
 0 <= Node.val <= 105
 
 */
//[90,69,null,49,89,null,52]

/*
 
        90
    69
 49   89
   52
 */
class Solution {
        
    func minDiffInBST(_ root: TreeNode?) -> Int {
        var ans = Int.max, prev: Int? = nil
        
        func dfs(_ p: TreeNode?)  {
            guard let p else { return }
            dfs(p.left)
            if let prev {
                ans = min(abs(prev - p.val), ans)
            }
            prev = p.val
            dfs(p.right)
        }
        dfs(root)
        return ans
    }
}

//: [Next](@next)
