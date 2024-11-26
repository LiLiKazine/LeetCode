//: [Previous](@previous)

/*
 1721. Swapping Nodes in a Linked List
 中等
 You are given the head of a linked list, and an integer k.

 Return the head of the linked list after swapping the values of the kth node from the beginning and the kth node from the end (the list is 1-indexed).

  

 Example 1:


 Input: head = [1,2,3,4,5], k = 2
 Output: [1,4,3,2,5]
 Example 2:

 Input: head = [7,9,6,6,7,8,3,0,9,5], k = 5
 Output: [7,9,6,6,8,7,3,0,9,5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= k <= n <= 105
 0 <= Node.val <= 100
 */

import Foundation

class Solution {
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var tail = head
        for _ in 0..<k-1 {
            tail = tail?.next
        }
        let n1 = tail
        var n2 = head
        while tail?.next != nil {
            n2 = n2?.next
            tail = tail?.next
        }
        let tmp = n1!.val
        n1?.val = n2!.val
        n2?.val = tmp
        return head
    }
}

//: [Next](@next)
