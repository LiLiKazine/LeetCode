//: [Previous](@previous)

/*
 2487. Remove Nodes From Linked List
 中等
 You are given the head of a linked list.

 Remove every node which has a node with a greater value anywhere to the right side of it.

 Return the head of the modified linked list.

  

 Example 1:


 Input: head = [5,2,13,3,8]
 Output: [13,8]
 Explanation: The nodes that should be removed are 5, 2 and 3.
 - Node 13 is to the right of node 5.
 - Node 13 is to the right of node 2.
 - Node 8 is to the right of node 3.
 Example 2:

 Input: head = [1,1,1,1]
 Output: [1,1,1,1]
 Explanation: Every node has value 1, so no nodes are removed.
  

 Constraints:

 The number of the nodes in the given list is in the range [1, 105].
 1 <= Node.val <= 105
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var p = [Int]()
        var cur = head
        while cur != nil {
            p.append(cur!.val)
            cur = cur?.next
        }
        if p.count <= 1 { return head }
        var prev = p.last!
        for i in stride(from: p.count - 2, through: 0, by: -1) {
            var tmp = p[i]
            p[i] = max(prev , p[i+1])
            prev = tmp
        }
        var sentry = ListNode(0, head), i = 0
        cur = sentry
        while cur?.next != nil {
            if cur!.next!.val < p[i] {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
            i += 1
        }
        return sentry.next
    }
}

//: [Next](@next)
