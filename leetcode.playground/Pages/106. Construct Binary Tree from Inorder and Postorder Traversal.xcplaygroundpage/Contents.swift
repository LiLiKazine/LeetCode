//: [Previous](@previous)

/*
 
 106. Construct Binary Tree from Inorder and Postorder Traversal
 
 Given inorder and postorder traversal of a tree, construct the binary tree.

 Note:
 You may assume that duplicates do not exist in the tree.

 For example, given

 inorder = [9,3,15,20,7]
 postorder = [9,15,7,20,3]
 Return the following binary tree:

     3
    / \
   9  20
     /  \
    15   7
 
 */
//[3,null,20,null,7]
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
    var map: [Int: Int] = [:]
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        for (i, v) in inorder.enumerated() {
            map[v] = i
        }
        var copy = postorder
        return backTracing(&copy, 0, inorder.count)
    }
    
    func backTracing(_ postorder: inout [Int], _ h: Int, _ t: Int) -> TreeNode? {
        if let mid = postorder.last, let i = map[mid], h < t {
            let root = TreeNode(mid)
            postorder.removeLast()
            root.right = backTracing(&postorder, i+1, t)
            root.left = backTracing(&postorder, h, i)
            return root
        } else {
            return nil
        }
    }
}

//: [Next](@next)
