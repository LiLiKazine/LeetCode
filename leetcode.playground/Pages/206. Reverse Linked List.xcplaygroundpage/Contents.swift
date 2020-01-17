//: [Previous](@previous)

/*
 206. Reverse Linked List
 Easy

 Reverse a singly linked list.

 Example:

 Input: 1->2->3->4->5->NULL
 Output: 5->4->3->2->1->NULL
 Follow up:

 A linked list can be reversed either iteratively or recursively. Could you implement both?

 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        let origin = ListNode(0)
        origin.next = head
        while head?.next != nil {
            let temp = head?.next
            head?.next = temp?.next
            temp?.next = origin.next
            origin.next = temp
        }
        return origin.next
    }
}

//: [Next](@next)
