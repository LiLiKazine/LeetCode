//: [Previous](@previous)

/*
 2583. Kth Largest Sum in a Binary Tree
 中等
 You are given the root of a binary tree and a positive integer k.

 The level sum in the tree is the sum of the values of the nodes that are on the same level.

 Return the kth largest level sum in the tree (not necessarily distinct). If there are fewer than k levels in the tree, return -1.

 Note that two nodes are on the same level if they have the same distance from the root.

  

 Example 1:


 Input: root = [5,8,9,2,1,3,7,4,6], k = 2
 Output: 13
 Explanation: The level sums are the following:
 - Level 1: 5.
 - Level 2: 8 + 9 = 17.
 - Level 3: 2 + 1 + 3 + 7 = 13.
 - Level 4: 4 + 6 = 10.
 The 2nd largest level sum is 13.
 Example 2:


 Input: root = [1,2,null,3], k = 1
 Output: 3
 Explanation: The largest level sum is 3.
  

 Constraints:

 The number of nodes in the tree is n.
 2 <= n <= 105
 1 <= Node.val <= 106
 1 <= k <= n
 */

import Foundation

class Solution {
    func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
        
        var sums: [Int] = []
        
        func dfs(_ node: TreeNode?, _ level: Int) {
            guard let node else { return }
            
            if level == sums.count {
                sums.append(node.val)
            } else {
                sums[level] += node.val
            }
            dfs(node.left, level + 1)
            dfs(node.right, level + 1)
        }
        dfs(root, 0)
        if sums.count < k {
            return -1
        }
        sums.sort(by: >)
        return sums[k - 1]
    }
}

//: [Next](@next)
