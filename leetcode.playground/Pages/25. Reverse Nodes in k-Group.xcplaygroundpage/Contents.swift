//: [Previous](@previous)

/*
 25. Reverse Nodes in k-Group
 困难
 Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

 You may not alter the values in the list's nodes, only nodes themselves may be changed.

  

 Example 1:


 Input: head = [1,2,3,4,5], k = 2
 Output: [2,1,4,3,5]
 Example 2:


 Input: head = [1,2,3,4,5], k = 3
 Output: [3,2,1,4,5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= k <= n <= 5000
 0 <= Node.val <= 1000
  

 Follow-up: Can you solve the problem in O(1) extra memory space?

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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        let sentry = ListNode()
        sentry.next = head
        
        var dummy: ListNode? = sentry
        
        while true {
            var tail = dummy?.next
            var k = k - 1
            while k > 0, tail != nil {
                tail = tail?.next
                k -= 1
            }
            if k > 0 || tail == nil {
                break
            }
            
            let temp = tail?.next
            tail?.next = nil
            let h = reverse(dummy?.next)
            dummy?.next?.next = temp
            let nextDummy = dummy?.next
            dummy?.next = h
            dummy = nextDummy
        }
        return sentry.next
    }

    private func reverse(_ node: ListNode?) -> ListNode? {
        let sentry = ListNode()
        var cur = node
        while cur != nil {
            let temp = sentry.next
            sentry.next = cur
            cur = cur?.next
            sentry.next?.next = temp
        }
        return sentry.next
    }
}

//: [Next](@next)
