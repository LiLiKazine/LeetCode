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
        if n == 0 {
            return []
        }
        let ans: [TreeNode?] = build(1, n)
        return ans
    }
    
    func build(_ start: Int, _ end: Int) -> [TreeNode?] {
        if start > end {
            return [nil]
        }

        var ans: [TreeNode?] = []
        
        for i in start...end {
            let left = build(start, i-1),
            right = build(i+1, end)
            
            for j in 0..<left.count {
                for k in 0..<right.count {
                    let root = TreeNode(i)
                    root.left = left[j]
                    root.right = right[k]
                    ans.append(root)
                }
            }
        }
        return ans
    }
    
}

let solution = Solution()
let ans = solution.generateTrees(3)
ans

//: [Next](@next)
