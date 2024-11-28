//: [Previous](@previous)

/*
 
 445. Add Two Numbers II
 
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

 Example:

 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7
 
 */

import Foundation

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        func reverse(_ p: ListNode?) -> ListNode? {
            var prev: ListNode? = nil, cur = p
            while cur != nil {
                let nxt = cur?.next
                cur?.next = prev
                prev = cur
                cur = nxt
            }
            return prev
        }
        var l1 = reverse(l1), l2 = reverse(l2)
        let sentry = ListNode(0)
        var n = 0, tail: ListNode? = sentry
        while l1 != nil || l2 != nil {
            let v1 = l1?.val ?? 0, v2 = l2?.val ?? 0
            let sum = v1 + v2 + n
            n = sum / 10
            let val = sum % 10
            tail?.next = ListNode(val)
            tail = tail?.next
            l1 = l1?.next, l2 = l2?.next
        }
        if n > 0 {
            tail?.next = ListNode(n)
        }
        return reverse(sentry.next)
    }
}

//: [Next](@next)
