//: [Previous](@previous)

/*
 
 530. Minimum Absolute Difference in BST
 
 Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.
 
 Example:
 
 Input:
 
 1
 \
 3
 /
 2
 
 Output:
 1
 
 Explanation:
 The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
 
 
 Note:
 
 There are at least two nodes in this BST.
 This question is the same as 783: https://leetcode.com/problems/minimum-distance-between-bst-nodes/
 
 */

class Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
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
