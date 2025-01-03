//: [Previous](@previous)

/*
 366. Find Leaves of Binary Tree
 中等
 Given the root of a binary tree, collect a tree's nodes as if you were doing this:
 
 Collect all the leaf nodes.
 Remove all the leaf nodes.
 Repeat until the tree is empty.
 
 
 Example 1:
 
 
 Input: root = [1,2,3,4,5]
 Output: [[4,5,3],[2],[1]]
 Explanation:
 [[3,5,4],[2],[1]] and [[3,4,5],[2],[1]] are also considered correct answers since per each level it does not matter the order on which elements are returned.
 Example 2:
 
 Input: root = [1]
 Output: [[1]]
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 100].
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
    
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        
        var ans = [[Int]]()
        
        func dfs(_ p: TreeNode?) -> Int {
            guard let p else { return -1 }
            
            var i = Int.min
            i = max(i, dfs(p.left))
            i = max(i, dfs(p.right))
            i += 1
            while ans.count < i + 1 { ans.append([]) }
            ans[i].append(p.val)
            return i
        }
        dfs(root)
        return ans
        
    }
    
}

//: [Next](@next)
