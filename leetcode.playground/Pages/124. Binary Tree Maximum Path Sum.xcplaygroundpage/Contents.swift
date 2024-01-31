//: [Previous](@previous)

/*
 124. Binary Tree Maximum Path Sum
 
 A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

 The path sum of a path is the sum of the node's values in the path.

 Given the root of a binary tree, return the maximum path sum of any non-empty path.

  

 Example 1:


 Input: root = [1,2,3]
 Output: 6
 Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.
 Example 2:


 Input: root = [-10,9,20,null,null,15,7]
 Output: 42
 Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3 * 104].
 -1000 <= Node.val <= 1000
 
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
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        let _ = maxPathSum(node: root)
        return cache.values.reduce(Int.min) { $0 > $1 ? $0 : $1 }
    }
    
    func maxPathSum(node: TreeNode?) -> Int? {
        guard let node else { return nil }
        if let val = cache[key(of: node)] {
            return val
        }
        var val = node.val
        let left = maxPathSum(node: node.left)
        let right = maxPathSum(node: node.right)
        if let left, let right {
            val = max(val, left + right + node.val)
        }
        if let left {
            val = max(val, left, left + node.val)
        }
        if let right {
            val = max(val, right, right + node.val)
        }
        cache[key(of: node)] = val
        return val
    }
    
    private struct Key: Hashable {
        let pointer: Int
        let val: Int
    }
    
    private func key(of node: TreeNode) -> Key {
        let pointer = Unmanaged.passUnretained(node).toOpaque()
        return .init(pointer: pointer.hashValue, val: node.val)
    }
    
}

//: [Next](@next)
