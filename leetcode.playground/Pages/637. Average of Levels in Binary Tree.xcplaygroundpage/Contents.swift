//: [Previous](@previous)

/*
 
 637. Average of Levels in Binary Tree
 
 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 Example 1:
 Input:
 3
 / \
 9  20
 /  \
 15   7
 Output: [3, 14.5, 11]
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
 Note:
 The range of node's value is in the range of 32-bit signed integer.
 
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
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var ans = [Double](), nodes = [root]
        while !nodes.isEmpty {
            var sum = 0, num = 0, nexts = [TreeNode?]()
            for node in nodes {
                if let node = node {
                    sum += node.val
                    num += 1
                    if let left = node.left {
                        nexts.append(left)
                    }
                    if let right = node.right {
                        nexts.append(right)
                    }
                }
            }
            if num > 0 {
                ans.append(Double(sum)/Double(num))
            }
            nodes = nexts
        }
        return ans
    }
}

//: [Next](@next)
