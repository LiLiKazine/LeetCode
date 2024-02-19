//: [Previous](@previous)

/*
 255. Verify Preorder Sequence in Binary Search Tree
 中等
 
 Given an array of unique integers preorder, return true if it is the correct preorder traversal sequence of a binary search tree.

  

 Example 1:


 Input: preorder = [5,2,1,3,6]
 Output: true
 Example 2:

 Input: preorder = [5,2,6,1,3]
 Output: false
  

 Constraints:

 1 <= preorder.length <= 104
 1 <= preorder[i] <= 104
 All the elements of preorder are unique.
  

 Follow up: Could you do it using only constant space complexity?

 */

import Foundation

class Solution {
    
    func verifyPreorder(_ preorder: [Int]) -> Bool {
        
        var stack = [Int]()
        var min = Int.min
        for value in preorder {
            if value < min {
                return false
            }
            while !stack.isEmpty && stack.last! < value {
                min = stack.removeLast()
            }
            stack.append(value)
        }
        return true
    }
    
}

//: [Next](@next)
