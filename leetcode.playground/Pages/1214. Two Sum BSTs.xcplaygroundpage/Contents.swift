//: [Previous](@previous)

/*
 1214. Two Sum BSTs
 中等
 Given the roots of two binary search trees, root1 and root2, return true if and only if there is a node in the first tree and a node in the second tree whose values sum up to a given integer target.
 
 
 
 Example 1:
 
 
 Input: root1 = [2,1,4], root2 = [1,0,3], target = 5
 Output: true
 Explanation: 2 and 3 sum up to 5.
 Example 2:
 
 
 Input: root1 = [0,-10,10], root2 = [5,1,7,0,2], target = 18
 Output: false
 
 
 Constraints:
 
 The number of nodes in each tree is in the range [1, 5000].
 -109 <= Node.val, target <= 109
 
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
    
    func twoSumBSTs(_ root1: TreeNode?, _ root2: TreeNode?, _ target: Int) -> Bool {
        var set = Set<Int>()
        
        func record(_ root: TreeNode?) {
            guard let root else { return }
            set.insert(root.val)
            record(root.left)
            record(root.right)
        }
        
        func find(_ root: TreeNode?, _ target: Int) -> Bool {
            guard let root else { return false }
            if set.contains(target - root.val) { return true }
            return find(root.left, target) || find(root.right, target)
        }
        
        record(root1)
        return find(root2, target)
    }
}

//: [Next](@next)
