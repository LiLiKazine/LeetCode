//: [Previous](@previous)

/*
 108. Convert Sorted Array to Binary Search Tree
 Easy

 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted array: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

       0
      / \
    -3   9
    /   /
  -10  5
 
 */
// 0 - 1  1 - 3   2 - 7  3 - 17
//       2      4       8
// (n-1)^2
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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty { return nil }
        let mid = nums.count / 2
        
        let root = TreeNode(nums[mid])
        if mid > 0 {
            root.left = sortedArrayToBST(Array(nums[..<mid]))
        }
        if mid < nums.count - 1 {
            let i = mid + 1
            root.right = sortedArrayToBST(Array(nums[i...]))
        }
        return root
    }
}

let test = Solution()
let root = test.sortedArrayToBST([-10,-3,0,5,9])
root
//: [Next](@next)
