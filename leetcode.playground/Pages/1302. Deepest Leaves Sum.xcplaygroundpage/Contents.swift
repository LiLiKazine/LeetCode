//: [Previous](@previous)

/*
 
 1302. Deepest Leaves Sum
 
 Given a binary tree, return the sum of values of its deepest leaves.
 
 
 Example 1:
 
 
 
 Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
 Output: 15
 
 
 Constraints:
 
 The number of nodes in the tree is between 1 and 10^4.
 The value of nodes is between 1 and 100.
 
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
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        var cache = [node]
        while true {
            var temp = [TreeNode]()
            for node in cache {
                if let left = node.left {
                    temp.append(left)
                }
                if let right = node.right {
                    temp.append(right)
                }
            }
            if temp.isEmpty {
                break
            } else {
                cache = temp
            }
        }
        return cache.reduce(0) { (res, node) -> Int in
            return res + node.val
        }
    }
}

//: [Next](@next)
