//: [Previous](@previous)

/*
 510. Inorder Successor in BST II
 中等
 Given a node in a binary search tree, return the in-order successor of that node in the BST. If that node has no in-order successor, return null.

 The successor of a node is the node with the smallest key greater than node.val.

 You will have direct access to the node but not to the root of the tree. Each node will have a reference to its parent node. Below is the definition for Node:

 class Node {
     public int val;
     public Node left;
     public Node right;
     public Node parent;
 }
  

 Example 1:


 Input: tree = [2,1,3], node = 1
 Output: 2
 Explanation: 1's in-order successor node is 2. Note that both the node and the return value is of Node type.
 Example 2:


 Input: tree = [5,3,6,2,4,null,null,1], node = 6
 Output: null
 Explanation: There is no in-order successor of the current node, so the answer is null.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105
 All Nodes will have unique values.
  

 Follow up: Could you solve it without looking up any of the node's values?


 */

import Foundation


public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var parent: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

class Solution {
    func inorderSuccessor(_ node: Node?) -> Node? {
        
        func head(of p: Node?) -> Node? {
            if let left = p?.left {
                return head(of: left)
            }
            return p
        }
        
        if let right = node?.right {
            return head(of: right)
        }
        var parent = node?.parent, prev = node
        while parent != nil  && parent?.right === prev {
            prev = parent
            parent = parent?.parent
        }
        return parent
    }
}

//: [Next](@next)
