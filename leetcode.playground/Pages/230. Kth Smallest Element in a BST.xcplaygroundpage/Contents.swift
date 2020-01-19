//: [Previous](@previous)

/*
 230. Kth Smallest Element in a BST
 Medium
 
 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.

 Note:
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.

 Example 1:

 Input: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 Output: 1
 Example 2:

 Input: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 Output: 3
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?

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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var flat: [Int] = []
        search(root!, &flat)
        return flat[k-1]
    }
    
    func search(_ node: TreeNode, _ arr: inout [Int]){
        if let left = node.left {
            search(left, &arr)
        }
        arr.append(node.val)
        if let right = node.right {
            search(right, &arr)
        }
    }
}

//: [Next](@next)
