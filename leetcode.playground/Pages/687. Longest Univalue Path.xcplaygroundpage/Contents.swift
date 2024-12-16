//: [Previous](@previous)

/*
 
 687. Longest Univalue Path
 
 Given a binary tree, find the length of the longest path where each node in the path has the same value. This path may or may not pass through the root.

 The length of path between two nodes is represented by the number of edges between them.

  

 Example 1:

 Input:

               5
              / \
             4   5
            / \   \
           1   1   5
 Output: 2

  

 Example 2:

 Input:

               1
              / \
             4   5
            / \   \
           4   4   5
 Output: 2

  

 Note: The given binary tree has not more than 10000 nodes. The height of the tree is not more than 1000.
 
 */

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

    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        
        var ans = 0
        
        func dfs(_ p: TreeNode?) -> Int {
            guard let p else { return 0 }
            
            var l = dfs(p.left), r = dfs(p.right)
            if let left = p.left, left.val != p.val {
                l = 0
            }
            if let right = p.right, right.val != p.val {
                r = 0
            }
            
            ans = max(ans, l + r)
            return max(l, r) + 1
        }
        
        dfs(root)
        
        return ans
     
    }
}

//: [Next](@next)
