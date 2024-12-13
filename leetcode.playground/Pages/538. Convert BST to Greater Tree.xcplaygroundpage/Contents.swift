//: [Previous](@previous)

/*
 
 538. Convert BST to Greater Tree
 
 Given a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.
 
 Example:
 
 Input: The root of a Binary Search Tree like this:
 5
 /   \
 2     13
 
 Output: The root of a Greater Tree like this:
 18
 /   \
 20     13
 Note: This question is the same as 1038: https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
 
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
    
    func convertBST(_ root: TreeNode?) -> TreeNode? {
       
        var total = 0
        
        func dfs(_ p: TreeNode?) {
            guard let p else { return }
            dfs(p.right)
            total += p.val
            p.val = total
            dfs(p.left)
        }
        dfs(root)
        return root
    }

}

//: [Next](@next)
