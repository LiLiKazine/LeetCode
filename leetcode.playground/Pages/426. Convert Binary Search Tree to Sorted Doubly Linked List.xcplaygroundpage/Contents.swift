//: [Previous](@previous)

/*
 426. Convert Binary Search Tree to Sorted Doubly Linked List
 中等
 Convert a Binary Search Tree to a sorted Circular Doubly-Linked List in place.

 You can think of the left and right pointers as synonymous to the predecessor and successor pointers in a doubly-linked list. For a circular doubly linked list, the predecessor of the first element is the last element, and the successor of the last element is the first element.

 We want to do the transformation in place. After the transformation, the left pointer of the tree node should point to its predecessor, and the right pointer should point to its successor. You should return the pointer to the smallest element of the linked list.

  

 Example 1:



 Input: root = [4,2,5,1,3]


 Output: [1,2,3,4,5]

 Explanation: The figure below shows the transformed BST. The solid line indicates the successor relationship, while the dashed line means the predecessor relationship.

 Example 2:

 Input: root = [2,1,3]
 Output: [1,2,3]
  

 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 All the values of the tree are unique.
 */

import Foundation

public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
 

class Solution {
    func treeToDoublyList(_ root: Node?) -> Node? {
        func dfs(_ node: Node?) -> (Node, Node)? {
            guard let node else { return nil }
            var resHead = node, resTail = node
            if let (head, tail) = dfs(node.left) {
                tail.right = node
                node.left = tail
                resHead = head
            }
            if let (head, tail) = dfs(node.right) {
                node.right = head
                head.left = node
                resTail = tail
            }
            return (resHead, resTail)
        }
        
        let res = dfs(root)
        return res?.0
    }
}

//: [Next](@next)
