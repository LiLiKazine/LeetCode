//: [Previous](@previous)

/*
 559. Maximum Depth of N-ary Tree
 简单
 Given a n-ary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).

  

 Example 1:



 Input: root = [1,null,3,2,4,null,5,6]
 Output: 3
 Example 2:



 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: 5
  

 Constraints:

 The total number of nodes is in the range [0, 104].
 The depth of the n-ary tree is less than or equal to 1000.

 */

import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        var ans = 0
        func dfs(_ n: Node?, _ depth: Int) {
            guard let n else { return }
            ans = max(ans, depth)
            for child in n.children {
                dfs(child, depth + 1)
            }
        }
        dfs(root, 1)
        return ans
    }
}

//: [Next](@next)
