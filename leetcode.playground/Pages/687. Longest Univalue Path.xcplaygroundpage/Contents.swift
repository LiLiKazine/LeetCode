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

/*
 
 class Solution {
     int ans;
     public int longestUnivaluePath(TreeNode root) {
         ans = 0;
         arrowLength(root);
         return ans;
     }
     public int arrowLength(TreeNode node) {
         if (node == null) return 0;
         int left = arrowLength(node.left);
         int right = arrowLength(node.right);
         int arrowLeft = 0, arrowRight = 0;
         if (node.left != null && node.left.val == node.val) {
             arrowLeft += left + 1;
         }
         if (node.right != null && node.right.val == node.val) {
             arrowRight += right + 1;
         }
         ans = Math.max(ans, arrowLeft + arrowRight);
         return Math.max(arrowLeft, arrowRight);
     }
 }

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
    var ans = 0
    
    func longestUnivaluePath(_ root: TreeNode?) -> Int {
        
        findLongest(root)
        
        return ans
    }
    
    func findLongest(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        
        let left = findLongest(root?.left), right = findLongest(root?.right)
        var leftLength = 0, rightLength = 0
        if root?.left?.val == root?.val {
            leftLength = left + 1
        }
        if root?.right?.val == root?.val {
            rightLength = right + 1
        }
        ans = max(ans, leftLength + rightLength)
        return max(leftLength, rightLength)
        
    }

}

//: [Next](@next)
