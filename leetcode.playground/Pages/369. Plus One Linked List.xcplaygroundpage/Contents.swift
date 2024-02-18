//: [Previous](@previous)

/*
 369. Plus One Linked List
 中等
 Given a non-negative integer represented as a linked list of digits, plus one to the integer.

 The digits are stored such that the most significant digit is at the head of the list.

  

 Example 1:

 Input: head = [1,2,3]
 Output: [1,2,4]
 Example 2:

 Input: head = [0]
 Output: [1]
  

 Constraints:

 The number of nodes in the linked list is in the range [1, 100].
 0 <= Node.val <= 9
 The number represented by the linked list does not contain leading zeros except for the zero itself.
 
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
    func plusOne(_ head: ListNode?) -> ListNode? {
        var node = reverse(head)
        let sentry = ListNode()
        sentry.next = node
        var plusOne = true
        while node != nil && plusOne {
            if node!.val < 9 {
                node?.val = node!.val + 1
                plusOne = false
                break
            } else {
                node?.val = 0
                node = node?.next
            }
        }
        let body = reverse(sentry.next)
        if plusOne {
            let head = ListNode(1)
            head.next = body
            return head
        } else {
            return body
        }
    }
    
    func reverse(_ node: ListNode?) -> ListNode? {
        var sentry = ListNode()
        var node = node
        while node != nil {
            let current = node
            node = node?.next
            let tail = sentry.next
            sentry.next = current
            current?.next = tail
        }
        return sentry.next
    }
}

//: [Next](@next)
