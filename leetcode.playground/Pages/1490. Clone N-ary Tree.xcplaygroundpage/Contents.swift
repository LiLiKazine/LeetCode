//: [Previous](@previous)

/*
 1490. Clone N-ary Tree
 中等
 Given a root of an N-ary tree, return a deep copy (clone) of the tree.
 
 Each node in the n-ary tree contains a val (int) and a list (List[Node]) of its children.
 
 class Node {
 public int val;
 public List<Node> children;
 }
 Nary-Tree input serialization is represented in their level order traversal, each group of children is separated by the null value (See examples).
 
 
 
 Example 1:
 
 
 
 Input: root = [1,null,3,2,4,null,5,6]
 Output: [1,null,3,2,4,null,5,6]
 Example 2:
 
 
 
 Input: root = [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 Output: [1,null,2,3,4,5,null,null,6,7,null,8,null,9,10,null,null,11,null,12,null,13,null,null,14]
 
 
 Constraints:
 
 The depth of the n-ary tree is less than or equal to 1000.
 The total number of nodes is between [0, 104].
 
 
 Follow up: Can your solution work for the graph problem?
 
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
    func cloneTree(_ root: Node?) -> Node? {
        guard let root else { return nil }
        
        let node = Node(root.val)
        copy(root.children, to: node)
        return node
    }
    
    func copy(_ nodes: [Node], to root: Node) {
        var children = [Node]()
        for node in nodes {
            let nextNode = Node(node.val)
            copy(node.children, to: nextNode)
            children.append(nextNode)
        }
        root.children = children
    }
}

//: [Next](@next)
