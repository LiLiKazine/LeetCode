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
        func build(_ inorder: [Int].SubSequence, _ postorder: [Int].SubSequence) -> TreeNode? {
            
            if inorder.endIndex <= inorder.startIndex {
                return nil
            }
            let root = TreeNode(postorder.last!)
            let pivot = map[postorder.last!]!
            let offset = pivot - inorder.startIndex
            if pivot > inorder.startIndex {
                root.left = build(inorder[inorder.startIndex..<pivot], postorder[postorder.startIndex..<postorder.startIndex + offset])
            }
            if pivot + 1 < inorder.endIndex {
                root.right = build(inorder[pivot+1..<inorder.endIndex], postorder[postorder.startIndex + offset..<postorder.endIndex - 1])
            }
            
            return root
        }
        
        return build(inorder[0...], postorder[0...])
    }
}

//: [Next](@next)
