//: [Previous](@previous)

/*
 95. Unique Binary Search Trees II
 Medium

 Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.

 Example:

 Input: 3
 Output:
 [
   [1,null,3,2],
   [3,2,null,1],
   [3,1,null,null,2],
   [2,1,3],
   [1,null,2,null,3]
 ]
 Explanation:
 The above output corresponds to the 5 unique BST's shown below:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3

 */

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        return []
    }
    
    func tree(_ l: ClosedRange<Int>, _ r: ClosedRange<Int>, _ node: TreeNode) -> [TreeNode] {
        var nodes: [TreeNode] = []
        for i in l {
            let n = TreeNode(i)
            node.left = n
            let new = tree(l.lowerBound, <#T##r: ClosedRange<Int>##ClosedRange<Int>#>, node.left!)
        }
        
    }
}

//: [Next](@next)
