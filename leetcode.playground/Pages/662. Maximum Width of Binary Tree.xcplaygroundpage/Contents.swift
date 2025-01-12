//: [Previous](@previous)
/*
 662. Maximum Width of Binary Tree
 中等
 Given the root of a binary tree, return the maximum width of the given tree.

 The maximum width of a tree is the maximum width among all levels.

 The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.

 It is guaranteed that the answer will in the range of a 32-bit signed integer.

  

 Example 1:


 Input: root = [1,3,2,5,3,null,9]
 Output: 4
 Explanation: The maximum width exists in the third level with length 4 (5,3,null,9).
 Example 2:


 Input: root = [1,3,2,5,null,null,9,6,null,7]
 Output: 7
 Explanation: The maximum width exists in the fourth level with length 7 (6,null,null,null,null,null,7).
 Example 3:


 Input: root = [1,3,2,5]
 Output: 2
 Explanation: The maximum width exists in the second level with length 2 (3,2).
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3000].
 -100 <= Node.val <= 100
 */

import Foundation

class Solution {
    
    func pow(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return 1 }
        if b == 1 { return a }
        let res = pow(a, b / 2) * pow(a, b / 2) * (b % 2 == 0 ? 1 : a)
        return res
    }
    
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        let modulo = pow(2, 32)
        print(modulo)
        guard let root else { return 0 }
        var queue: [(Int, TreeNode)] = [(1, root)], ans = 1
        while queue.count > 0 {
            var next = [(Int, TreeNode)]()
            for (i, node) in queue {
                var i = i % modulo
                if let left = node.left { next.append(((i * 2) % modulo, left)) }
                if let right = node.right { next.append(((i * 2 + 1) % modulo, right)) }
            }
            queue = next
            if next.count > 0 {
                ans = max(ans, next.last!.0 - next[0].0 + 1)
            }
        }
        return ans
    }
}

//: [Next](@next)
