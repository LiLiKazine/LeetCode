//: [Previous](@previous)

/*
 549. Binary Tree Longest Consecutive Sequence II
 中等
 Given the root of a binary tree, return the length of the longest consecutive path in the tree.

 A consecutive path is a path where the values of the consecutive nodes in the path differ by one. This path can be either increasing or decreasing.

 For example, [1,2,3,4] and [4,3,2,1] are both considered valid, but the path [1,2,4,3] is not valid.
 On the other hand, the path can be in the child-Parent-child order, where not necessarily be parent-child order.

  

 Example 1:


 Input: root = [1,2,3]
 Output: 2
 Explanation: The longest consecutive path is [1, 2] or [2, 1].
 Example 2:


 Input: root = [2,1,3]
 Output: 3
 Explanation: The longest consecutive path is [1, 2, 3] or [3, 2, 1].
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3 * 104].
 -3 * 104 <= Node.val <= 3 * 104
 
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func longestConsecutive(_ root: TreeNode?) -> Int {
        
        var ans = 0
        
        func dfs(_ p: TreeNode?) -> (inc: Int, dec: Int) {
            guard let p else { return (0, 0) }
            var (linc, ldec) = dfs(p.left)
            var (rinc, rdec) = dfs(p.right)
            if let left = p.left {
               if left.val != p.val + 1 {
                   linc = 0
               }
                if left.val != p.val - 1 {
                    ldec = 0
                }
            }
            if let right = p.right {
                if right.val != p.val + 1 {
                    rinc = 0
                }
                if right.val != p.val - 1 {
                    rdec = 0
                }
            }
            ans = max(ans, linc + rdec + 1, ldec + rinc + 1)
            return (max(linc, rinc) + 1, max(ldec, rdec) + 1)
        }
        dfs(root)
        return ans
        
    }
    
}

/*
 public class Solution {
    int maxval = 0;
    
    public int longestConsecutive(TreeNode root) {
        longestPath(root);
        return maxval;
    }
    
    public int[] longestPath(TreeNode root) {
        if (root == null) {
            return new int[] {0,0};
        }
        
        int inr = 1, dcr = 1;
        if (root.left != null) {
            int[] left = longestPath(root.left);
            if (root.val == root.left.val + 1) {
                dcr = left[1] + 1;
            } else if (root.val == root.left.val - 1) {
                inr = left[0] + 1;
            }
        }
        
        if (root.right != null) {
            int[] right = longestPath(root.right);
            if (root.val == root.right.val + 1) {
                dcr = Math.max(dcr, right[1] + 1);
            } else if (root.val == root.right.val - 1) {
                inr = Math.max(inr, right[0] + 1);
            }
        }
        
        maxval = Math.max(maxval, dcr + inr - 1);
        return new int[] {inr, dcr};
    }
 }
 */



//: [Next](@next)
