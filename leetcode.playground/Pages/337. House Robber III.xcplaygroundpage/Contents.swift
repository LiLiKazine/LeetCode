//: [Previous](@previous)

/*
 337. House Robber III
 
 The thief has found himself a new place for his thievery again. There is only one entrance to this area, called root.

 Besides the root, each house has one and only one parent house. After a tour, the smart thief realized that all houses in this place form a binary tree. It will automatically contact the police if two directly-linked houses were broken into on the same night.

 Given the root of the binary tree, return the maximum amount of money the thief can rob without alerting the police.

  

 Example 1:


 Input: root = [3,2,3,null,3,null,1]
 Output: 7
 Explanation: Maximum amount of money the thief can rob = 3 + 3 + 1 = 7.
 Example 2:


 Input: root = [3,4,5,1,3,null,1]
 Output: 9
 Explanation: Maximum amount of money the thief can rob = 4 + 5 = 9.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 104
 
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
    
    private var cache = [Key: Int]()
    
    func rob(_ root: TreeNode?) -> Int {
        return rob(root, robbed: false)
    }
    
    func rob(_ node: TreeNode?, robbed: Bool) -> Int {
        guard let node else { return 0 }
        
        if let val = cache[key(of: node, robbed: robbed)] { return val }
        
        var ans = rob(node.left, robbed: false) + rob(node.right, robbed: false)
        if !robbed {
            ans = max(ans, node.val + rob(node.left, robbed: true) + rob(node.right, robbed: true))
        }
        cache[key(of: node, robbed: robbed)] = ans
        return ans
    }
    
    private struct Key: Hashable {
        let robbed: Bool
        let pointer: UnsafeMutableRawPointer
    }
    
    private func key(of node: TreeNode, robbed: Bool) -> Key {
        let pointer = Unmanaged.passUnretained(node).toOpaque()
        return .init(robbed: robbed, pointer: pointer)
    }
}

//: [Next](@next)
