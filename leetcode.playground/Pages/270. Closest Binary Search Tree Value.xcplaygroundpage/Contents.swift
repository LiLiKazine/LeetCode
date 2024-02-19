//: [Previous](@previous)

/*
 270. Closest Binary Search Tree Value
 简单
 Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target. If there are multiple answers, print the smallest.
 
 
 
 Example 1:
 
 
 Input: root = [4,2,5,1,3], target = 3.714286
 Output: 4
 Example 2:
 
 Input: root = [1], target = 4.428571
 Output: 1
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 109
 -109 <= target <= 109
 
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
        
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard let root else { return 0 }
        let (ans, _) = find(root, target: target)
        return ans
    }
    
    func find(_ node: TreeNode, target: Double) -> (Int, Double) {
        let value = Double(node.val)
        
        if value == target { return (node.val, 0) }
        
        var (ans, dif) = (node.val, abs(value - target))
        if let left = node.left {
            let (l_a, l_d) = find(left, target: target)
            if l_d <= dif {
                ans = l_a
                dif = l_d
            }
        }
        if let right = node.right {
            let (r_a, r_d) = find(right, target: target)
            if r_d < dif {
                ans = r_a
                dif = r_d
            }
        }
        return (ans, dif)
    }
}

//: [Next](@next)
