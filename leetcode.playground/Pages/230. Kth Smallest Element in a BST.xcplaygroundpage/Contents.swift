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
        
        var ans = 0, prev = 0
        func dfs(_ p: TreeNode?) {
            guard let p, prev < k else { return }
            dfs(p.left)
            prev += 1
            if prev == k {
                ans = p.val
            }
            
            dfs(p.right)
        }
        dfs(root)
        return ans
    }
}

//: [Next](@next)
