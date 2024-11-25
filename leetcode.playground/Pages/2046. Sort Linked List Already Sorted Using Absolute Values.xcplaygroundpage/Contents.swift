//: [Previous](@previous)

/*
 2046. Sort Linked List Already Sorted Using Absolute Values
 中等
 Given the head of a singly linked list that is sorted in non-decreasing order using the absolute values of its nodes, return the list sorted in non-decreasing order using the actual values of its nodes.
  

 Example 1:


 Input: head = [0,2,-5,5,10,-10]
 Output: [-10,-5,0,2,5,10]
 Explanation:
 The list sorted in non-descending order using the absolute values of the nodes is [0,2,-5,5,10,-10].
 The list sorted in non-descending order using the actual values is [-10,-5,0,2,5,10].
 Example 2:


 Input: head = [0,1,2]
 Output: [0,1,2]
 Explanation:
 The linked list is already sorted in non-decreasing order.
 Example 3:

 Input: head = [1]
 Output: [1]
 Explanation:
 The linked list is already sorted in non-decreasing order.
  

 Constraints:

 The number of nodes in the list is the range [1, 105].
 -5000 <= Node.val <= 5000
 head is sorted in non-decreasing order using the absolute value of its nodes.
  

 Follow up:
 Can you think of a solution with O(n) time complexity?
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
    func sortLinkedList(_ head: ListNode?) -> ListNode? {
        let sentry = ListNode(Int.min, head)
        
        func insert(_ node: ListNode) {
            var cur = sentry
            while cur.next != nil && !(cur.val <= node.val && cur.next!.val >= node.val) {
                cur = cur.next!
            }
            node.next = cur.next
            cur.next = node
        }
        var tail = sentry
        while tail.next != nil {
            if tail.val > tail.next!.val {
                let node = tail.next!
                tail.next = tail.next?.next
                insert(node)
            } else {
                tail = tail.next!
            }
        }
        return sentry.next
    }
}

//: [Next](@next)
