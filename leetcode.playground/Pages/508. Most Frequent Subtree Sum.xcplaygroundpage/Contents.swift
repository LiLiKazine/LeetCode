//: [Previous](@previous)

/*
 508. Most Frequent Subtree Sum
 中等
 Given the root of a binary tree, return the most frequent subtree sum. If there is a tie, return all the values with the highest frequency in any order.

 The subtree sum of a node is defined as the sum of all the node values formed by the subtree rooted at that node (including the node itself).

  

 Example 1:


 Input: root = [5,2,-3]
 Output: [2,-3,4]
 Example 2:


 Input: root = [5,2,-5]
 Output: [2]
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105
 */

import Foundation

class Solution {
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        
        var ans = [Int]()
        
        var counts: [Int: Int] = [:]
        
        func dfs(_ p: TreeNode?) -> Int {
            guard let p else { return 0 }
            
            let sum = p.val + dfs(p.left) + dfs(p.right)
            counts[sum, default: 0] += 1
            return sum
        }
        dfs(root)
        var prev = -1
        for (k, v) in counts.sorted(by: { $0.value > $1.value }) {
            guard prev < 0 || prev == v else {
                break
            }
            prev = v
            ans.append(k)
        }
        return ans
    }
}

//: [Next](@next)
