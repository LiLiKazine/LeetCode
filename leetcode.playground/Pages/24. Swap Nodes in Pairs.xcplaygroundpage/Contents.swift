//: [Previous](@previous)

/*
 
 24. Swap Nodes in Pairs
 
 Given a linked list, swap every two adjacent nodes and return its head.

 You may not modify the values in the list's nodes. Only nodes itself may be changed.

  

 Example 1:


 Input: head = [1,2,3,4]
 Output: [2,1,4,3]
 Example 2:

 Input: head = []
 Output: []
 Example 3:

 Input: head = [1]
 Output: [1]
  

 Constraints:

 The number of nodes in the list is in the range [0, 100].
 0 <= Node.val <= 100
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var n = 0, cur = head
        while cur != nil {
            n += 1
            cur = cur?.next
        }
        let sentry = ListNode(0, head)
        var p0: ListNode? = sentry
        while n > 1 {
            n -= 2
            var prev: ListNode? = nil, cur = p0?.next
            for _ in 0..<2 {
                let nxt = cur?.next
                cur?.next = prev
                prev = cur
                cur = nxt
            }
            p0?.next?.next = cur
            var p1 = p0?.next
            p0?.next = prev
            p0 = p1
        }
        return sentry.next
    }
}

//: [Next](@next)
