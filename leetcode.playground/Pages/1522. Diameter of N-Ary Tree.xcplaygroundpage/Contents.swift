//: [Previous](@previous)

/*
 1522. Diameter of N-Ary Tree
 中等
 
 Given a root of an N-ary tree, you need to compute the length of the diameter of the tree.

 The diameter of an N-ary tree is the length of the longest path between any two nodes in the tree. This path may or may not pass through the root.

 (Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value.)

  

 Example 1:



 Input: root = [1,null,3,2,4,null,5,6]
 Output: 3
 Explanation: Diameter is shown in red color.
 Example 2:



 Input: root = [1,null,2,null,3,4,null,5,null,6]
 Output: 4
 Example 3:



 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: 7
  

 Constraints:

 The depth of the n-ary tree is less than or equal to 1000.
 The total number of nodes is between [1, 104].
 
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
    
    var ans = 0
    
    func diameter(_ root: Node?) -> Int {
        let _ = find(root)
        return ans - 1
    }
    
    func find(_ node: Node?) -> Int {
        
        guard let node else { return 0 }
        var a = 0, b = 0
        for child in node.children {
            let cnt = find(child)
            if cnt > a {
                b = a
                a = cnt
            } else if cnt > b {
                b = cnt
            }
        }
        ans = max(ans, a + 1 + b)
        return a + 1
    }
}

//: [Next](@next)
