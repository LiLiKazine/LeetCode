//: [Previous](@previous)

/*
 314. Binary Tree Vertical Order Traversal
 中等
 Given the root of a binary tree, return the vertical order traversal of its nodes' values. (i.e., from top to bottom, column by column).
 
 If two nodes are in the same row and column, the order should be from left to right.
 
 
 
 Example 1:
 
 
 Input: root = [3,9,20,null,null,15,7]
 Output: [[9],[3,15],[20],[7]]
 Example 2:
 
 
 Input: root = [3,9,8,4,0,1,7]
 Output: [[4],[9],[3,0,1],[8],[7]]
 Example 3:
 
 
 Input: root = [3,9,8,4,0,1,7,null,null,null,2,5]
 Output: [[4],[9,5],[3,0,1],[8,2],[7]]
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 
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
    
    var map = [Int: [Node]]()
    
    struct Node: Hashable {
        let value: Int
        let depth: Int
    }
    
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        traversal(root, baseline: 0, depth: 0)
        let keys = map.keys.sorted()
        var ans = [[Int]]()
        for key in keys {
            var nodes = map[key]!
            // print(nodes)
            nodes.sort { $0.depth < $1.depth }
            ans.append(nodes.map { $0.value })
        }
        return ans
    }
    
    func traversal(_ node: TreeNode?, baseline: Int, depth: Int) {
        guard let node else { return }
        let arr = map[baseline] ?? []
        map[baseline] = arr + [Node(value: node.val, depth: depth)]
        traversal(node.left, baseline: baseline - 1, depth: depth + 1)
        traversal(node.right, baseline: baseline + 1, depth: depth + 1)
    }
}

//: [Next](@next)
