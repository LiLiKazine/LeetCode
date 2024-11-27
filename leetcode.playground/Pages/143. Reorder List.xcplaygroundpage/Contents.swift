//: [Previous](@previous)

/*
 
 143. Reorder List
 
 Given a singly linked list L: L0→L1→…→Ln-1→Ln,
 reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…
 
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 
 Example 1:
 
 Given 1->2->3->4, reorder it to 1->4->2->3.
 Example 2:
 
 Given 1->2->3->4->5, reorder it to 1->5->2->4->3.
 
 */

class Solution {
    func reorderList(_ head: ListNode?) {
        var fast = head, slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        var prev: ListNode? = nil, cur = slow
        while cur != nil {
            let nxt = cur?.next
            cur?.next = prev
            prev = cur
            cur = nxt
        }
        var p1 = head, p2 = prev
        while p2 != nil {
            let nxt1 = p1?.next, nxt2 = p2?.next
            p1?.next = p2
            p2?.next = nxt1
            p1 = nxt1
            p2 = nxt2
        }
        p1?.next?.next = nil
    }
}

//: [Next](@next)
