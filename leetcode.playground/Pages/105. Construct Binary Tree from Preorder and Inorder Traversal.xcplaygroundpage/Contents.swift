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
    var map: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var copy = preorder
        for (i, v) in inorder.enumerated() {
            map[v] = i
        }
        return backTracing(&copy, 0, inorder.count)
    }
    
    func backTracing(_ preorder: inout [Int], _ h: Int, _ t: Int) -> TreeNode? {
        if let val = preorder.first, let i = map[val], h < t {
            let root = TreeNode(val)
            preorder.removeFirst()
            root.left = backTracing(&preorder, h, i)
            root.right = backTracing(&preorder, i+1, t)
            return root
        }
        return nil
    }
}

let test = Solution()
let res = test.buildTree([3,9,20,15,7], [9,3,15,20,7])

//: [Next](@next)
