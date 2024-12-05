//: [Previous](@previous)

/*
 
 226. Invert Binary Tree
 
 Invert a binary tree.
 
 Example:
 
 Input:
 
 4
 /   \
 2     7
 / \   / \
 1   3 6   9
 Output:
 
 4
 /   \
 7     2
 / \   / \
 9   6 3   1
 Trivia:
 This problem was inspired by this original tweet by Max Howell:
 
 Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
 
 
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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else {
            return nil
        }
        let right = root.right
        root.right = root.left
        root.left = right
        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}

//: [Next](@next)
