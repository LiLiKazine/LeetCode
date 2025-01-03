//: [Previous](@previous)

/*
 21. Merge Two Sorted Lists
 简单
 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.

  

 Example 1:


 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 Example 2:

 Input: list1 = [], list2 = []
 Output: []
 Example 3:

 Input: list1 = [], list2 = [0]
 Output: [0]
  

 Constraints:

 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both list1 and list2 are sorted in non-decreasing order.
 */

import Foundation

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let sentry = ListNode(0)
        var cur: ListNode? = sentry, list1 = list1, list2 = list2
        while list1 != nil || list2 != nil {
            if list1 == nil {
                cur?.next = list2
                break
            } else if list2 == nil {
                cur?.next = list1
                break
            } else if list1!.val < list2!.val {
                cur?.next = list1
                list1 = list1?.next
            } else {
                cur?.next = list2
                list2 = list2?.next
            }
            cur = cur?.next
        }
        return sentry.next
    }
}

//: [Next](@next)
