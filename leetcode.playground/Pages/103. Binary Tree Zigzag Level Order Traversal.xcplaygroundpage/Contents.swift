//: [Previous](@previous)

/*
 
 103. Binary Tree Zigzag Level Order Traversal
 
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its zigzag level order traversal as:
 [
   [3],
   [20,9],
   [15,7]
 ]
 
 */

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
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var flag = true, lev = [root], ans = [[Int]]()
        while !lev.isEmpty {
            var tempVal: [Int] = [], tempNodes: [TreeNode] = []
            for node in lev {
                if flag {
                    tempVal.append(node.val)
                } else {
                    tempVal.insert(node.val, at: 0)
                }
                if let left = node.left {
                    tempNodes.append(left)
                }
                if let right = node.right {
                    tempNodes.append(right)
                }
            }
            ans.append(tempVal)
            flag.toggle()
            lev = tempNodes
        }
        
        return ans
    }
}

//: [Next](@next)
