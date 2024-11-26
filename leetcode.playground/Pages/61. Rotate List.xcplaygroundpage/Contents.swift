//: [Previous](@previous)

/*
 
 61. Rotate List
 
 Given the head of a linked list, rotate the list to the right by k places.

  

 Example 1:


 Input: head = [1,2,3,4,5], k = 2
 Output: [4,5,1,2,3]
 Example 2:


 Input: head = [0,1,2], k = 4
 Output: [2,0,1]
  

 Constraints:

 The number of nodes in the list is in the range [0, 500].
 -100 <= Node.val <= 100
 0 <= k <= 2 * 109
 
 */

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var n = 0, cur = head
        while cur != nil {
            n += 1
            cur = cur?.next
        }
        if n == 0 {
            return nil
        }
        let k = k % n
        if k == 0 {
            return head
        }
        var tail = head
        for _ in 0..<k {
            tail = tail?.next
        }
        let sentry = ListNode(0, head)
        var p = head
        while tail?.next != nil {
            tail = tail?.next
            p = p?.next
        }
        tail?.next = head
        sentry.next = p?.next
        p?.next = nil
        return sentry.next
    }
}

//: [Next](@next)
