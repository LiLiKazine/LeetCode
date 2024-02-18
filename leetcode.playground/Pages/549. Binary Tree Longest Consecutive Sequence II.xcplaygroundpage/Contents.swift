//: [Previous](@previous)

/*
 549. Binary Tree Longest Consecutive Sequence II
 中等
 Given the root of a binary tree, return the length of the longest consecutive path in the tree.

 A consecutive path is a path where the values of the consecutive nodes in the path differ by one. This path can be either increasing or decreasing.

 For example, [1,2,3,4] and [4,3,2,1] are both considered valid, but the path [1,2,4,3] is not valid.
 On the other hand, the path can be in the child-Parent-child order, where not necessarily be parent-child order.

  

 Example 1:


 Input: root = [1,2,3]
 Output: 2
 Explanation: The longest consecutive path is [1, 2] or [2, 1].
 Example 2:


 Input: root = [2,1,3]
 Output: 3
 Explanation: The longest consecutive path is [1, 2, 3] or [3, 2, 1].
  

 Constraints:

 The number of nodes in the tree is in the range [1, 3 * 104].
 -3 * 104 <= Node.val <= 3 * 104
 
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
    func longestConsecutive(_ root: TreeNode?) -> Int {
        let val = (root?.val ?? 0) - 1
        return max(
            find(root, value: val, cnt: 0, isIncrease: true, canBiforcate: true),
            find(root, value: val, cnt: 0, isIncrease: false, canBiforcate: true)
        )
    }
    
    func find(_ node: TreeNode?, value: Int, cnt: Int, isIncrease: Bool, canBiforcate: Bool) -> Int {
        guard let node else { return cnt }
        let nextVal = isIncrease ? value + 1 : value - 1
        if !canBiforcate && node.val != nextVal {
            return cnt
        }
        let nextCnt = node.val == nextVal ? cnt + 1 : 1
        // print("val:", node.val, "prev:", value, "cnt:", cnt, isIncrease, canBiforcate, "nextVal:", nextVal, "nextCnt:", nextCnt)
        var ans = max(
            cnt,
            find(node.left, value: node.val, cnt: nextCnt, isIncrease: isIncrease, canBiforcate: canBiforcate),
            find(node.right, value: node.val, cnt: nextCnt, isIncrease: isIncrease, canBiforcate: canBiforcate)
        )
        if canBiforcate {
            ans = max(
                ans,
                find(node.left, value: node.val, cnt: 1, isIncrease: true, canBiforcate: false) + find(node.right, value: node.val, cnt: 1, isIncrease: false, canBiforcate: false) - 1,
                find(node.left, value: node.val, cnt: 1, isIncrease: false, canBiforcate: false) + find(node.right, value: node.val, cnt: 1, isIncrease: true, canBiforcate: false) - 1
            )
        }
        return ans
    }
    
}




//: [Next](@next)
