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
        let sentry: ListNode? = ListNode(0)
        sentry?.next = head
        var node = sentry
        while node?.next != nil && node?.next?.next != nil {
            let temp = node?.next
            node?.next = node?.next?.next
            temp?.next = node?.next?.next
            node?.next?.next = temp
            node = node?.next?.next
            
        }
        return sentry?.next
    }
}

//: [Next](@next)
