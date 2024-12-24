//: [Previous](@previous)

/*
 
 105. Construct Binary Tree from Preorder and Inorder Traversal
 
 Given preorder and inorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
 
 
 */

import Foundation

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
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let n = preorder.count
        guard n > 0 else { return nil }
        
        let rootVal = preorder[0]
        if n == 1 { return TreeNode(rootVal) }

        let root = TreeNode(rootVal)
        
        let pivot = inorder.firstIndex(of: rootVal)!
        if pivot > 0 {
            root.left = buildTree(Array(preorder[1..<pivot+1]), Array(inorder[0..<pivot]))
        }
        if pivot + 1 < inorder.count {
            root.right = buildTree(Array(preorder[(pivot+1)...]), Array(inorder[(pivot+1)...]))
        }
        
        return root
    }
    
}

let test = Solution()
let res = test.buildTree([3,9,20,15,7], [9,3,15,20,7])

//: [Next](@next)
