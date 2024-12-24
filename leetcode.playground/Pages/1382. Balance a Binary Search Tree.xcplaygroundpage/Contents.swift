//: [Previous](@previous)

/*
 1382. Balance a Binary Search Tree
 中等
 Given the root of a binary search tree, return a balanced binary search tree with the same node values. If there is more than one answer, return any of them.

 A binary search tree is balanced if the depth of the two subtrees of every node never differs by more than 1.

  

 Example 1:


 Input: root = [1,null,2,null,3,null,4,null,null]
 Output: [2,1,3,null,null,null,4]
 Explanation: This is not the only correct answer, [3,1,4,null,2] is also correct.
 Example 2:


 Input: root = [2,1,3]
 Output: [2,1,3]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 1 <= Node.val <= 105
 */

import Foundation

class Solution {
    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        
        var arr = [Int]()
        
        func flat(_ p: TreeNode?){
            guard let p else { return }
            flat(p.left)
            arr.append(p.val)
            flat(p.right)
        }
        flat(root)
        func build(_ nums: Array<Int>.SubSequence) -> TreeNode? {
            if nums.isEmpty {
                return nil
            }
            let mid = nums.startIndex + (nums.endIndex - nums.startIndex) / 2
            let node = TreeNode(nums[mid])
            if mid > nums.startIndex {
                node.left = build(nums[nums.startIndex..<mid])
            }
            if mid + 1 < nums.endIndex {
                node.right = build(nums[(mid+1)..<nums.endIndex])
            }
            return node
        }
        return build(arr[0...])
    }
}

//: [Next](@next)
