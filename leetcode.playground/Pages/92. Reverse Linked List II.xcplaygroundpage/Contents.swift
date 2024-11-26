//: [Previous](@previous)

/*
 
 92. Reverse Linked List II
 
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

  

 Example 1:


 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]
 Example 2:

 Input: head = [5], left = 1, right = 1
 Output: [5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n
  

 Follow up: Could you do it in one pass?
 
 */


class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        let sentry = ListNode(0, head)
        var p0: ListNode? = sentry
        for _ in 0..<left-1 {
            p0 = p0?.next
        }
        var prev: ListNode? = nil, cur = p0?.next
        let len = right - left + 1
        for _ in 0..<len {
            let nxt = cur?.next
            cur?.next = prev
            prev = cur
            cur = nxt
        }
        
        p0?.next?.next = cur
        p0?.next = prev
        return sentry.next
    }
}

//: [Next](@next)
