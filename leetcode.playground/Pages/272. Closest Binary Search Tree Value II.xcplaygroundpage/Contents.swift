//: [Previous](@previous)

/*
 272. Closest Binary Search Tree Value II
 困难
 Given the root of a binary search tree, a target value, and an integer k, return the k values in the BST that are closest to the target. You may return the answer in any order.
 
 You are guaranteed to have only one unique set of k values in the BST that are closest to the target.
 
 
 
 Example 1:
 
 
 Input: root = [4,2,5,1,3], target = 3.714286, k = 2
 Output: [4,3]
 Example 2:
 
 Input: root = [1], target = 0.000000, k = 1
 Output: [1]
 
 
 Constraints:
 
 The number of nodes in the tree is n.
 1 <= k <= n <= 104.
 0 <= Node.val <= 109
 -109 <= target <= 109
 
 
 Follow up: Assume that the BST is balanced. Could you solve it in less than O(n) runtime (where n = total nodes)?
 
 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    
    var queue = [Int]()
    
    func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
        dfs(root, target, k)
        return queue
    }
    
    func dfs(_ node: TreeNode?, _ target: Double, _ k: Int) {
        guard let node else { return }
        
        if let left = node.left {
            dfs(left, target, k)
        }
        if queue.count < k {
            queue.append(node.val)
        } else {
            if abs(Double(queue.first!) - target) > abs(Double(node.val) - target) {
                queue.removeFirst()
                queue.append(node.val)
            } else {
                return
            }
        }
        if let right = node.right {
            dfs(right, target, k)
        }
    }
    
}

//: [Next](@next)
