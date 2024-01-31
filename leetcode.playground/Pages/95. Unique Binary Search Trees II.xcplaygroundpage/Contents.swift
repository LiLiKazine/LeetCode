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
        
        return generateTrees(start: 1, end: n)
    }
    
    func generateTrees(start: Int, end: Int) -> [TreeNode?] {
        if start > end { return [nil] }
        if start == end { return [TreeNode(start)] }
        var ans = [TreeNode?]()
        for i in start...end {
            let l_trees = generateTrees(start: start, end: i-1)
            let r_trees = generateTrees(start: i+1, end: end)
            for l_tree in l_trees {
                for r_tree in r_trees {
                    let root = TreeNode(i)
                    root.left = l_tree
                    root.right = r_tree
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
