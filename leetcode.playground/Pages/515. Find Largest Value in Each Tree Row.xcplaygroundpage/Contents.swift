//: [Previous](@previous)

/*
 515. Find Largest Value in Each Tree Row
 中等
 Given the root of a binary tree, return an array of the largest value in each row of the tree (0-indexed).

  

 Example 1:


 Input: root = [1,3,2,5,3,null,9]
 Output: [1,3,9]
 Example 2:

 Input: root = [1,2,3]
 Output: [1,3]
  

 Constraints:

 The number of nodes in the tree will be in the range [0, 104].
 -231 <= Node.val <= 231 - 1
 */

import Foundation
 
class Solution {
    func largestValues(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var ans = [Int]()
        var queue = [root]
        while !queue.isEmpty {
            let size = queue.count
            var maxValue = Int.min
            for _ in 0..<size {
                let node = queue.removeFirst()
                maxValue = max(maxValue, node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            ans.append(maxValue)
        }
        return ans
    }
}

//: [Next](@next)
