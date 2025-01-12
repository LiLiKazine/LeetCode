//: [Previous](@previous)

/*
 3157. Find the Level of Tree with Minimum Sum
 中等
 Given the root of a binary tree root where each node has a value, return the level of the tree that has the minimum sum of values among all the levels (in case of a tie, return the lowest level).

 Note that the root of the tree is at level 1 and the level of any other node is its distance from the root + 1.

  

 Example 1:

 Input: root = [50,6,2,30,80,7]

 Output: 2

 Explanation:



 Example 2:

 Input: root = [36,17,10,null,null,24]

 Output: 3

 Explanation:



 Example 3:

 Input: root = [5,null,5,null,5]

 Output: 1

 Explanation:



  

 Constraints:

 The number of nodes in the tree is in the range [1, 105].
 1 <= Node.val <= 109
 */

import Foundation

class Solution {
    func minimumLevel(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        
        var queue = [root], ans = 1, val = root.val, depth = 0
        
        while queue.count > 0 {
            depth += 1
            let size = queue.count
            var sum = 0
            for _ in 0..<size {
                let node = queue.removeFirst()
                sum += node.val
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            if sum < val {
                ans = depth
                val = sum
            }
        }
        
        return ans
    }
}

//: [Next](@next)
