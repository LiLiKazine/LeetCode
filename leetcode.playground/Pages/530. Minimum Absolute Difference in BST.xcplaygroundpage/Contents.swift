//: [Previous](@previous)

/*
 
 530. Minimum Absolute Difference in BST
 
 Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.
 
 Example:
 
 Input:
 
 1
 \
 3
 /
 2
 
 Output:
 1
 
 Explanation:
 The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
 
 
 Note:
 
 There are at least two nodes in this BST.
 This question is the same as 783: https://leetcode.com/problems/minimum-distance-between-bst-nodes/
 
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
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var node = root, stack = [TreeNode?](), list = [Int](), ans = Int.max
        enstack(root, &stack)
        while !stack.isEmpty {
            node = stack.removeLast()
            list.append(node!.val)
            if let right = node?.right {
                enstack(right, &stack)
            }
        }
        print(list)
        for i in 1..<list.count {
            ans = min(ans, list[i] - list[i-1])
        }
        return ans
    }
    
    func enstack(_ node: TreeNode?, _ stack: inout [TreeNode?]) {
        guard var node = node else {
            return
        }
        stack.append(node)
        while node.left != nil {
            node = node.left!
            stack.append(node)
        }
    }
}

let root = TreeNode(1)
root.right = TreeNode(3)
root.right?.left = TreeNode(2)

let solution = Solution()
let ans = solution.getMinimumDifference(root)
ans

//: [Next](@next)
