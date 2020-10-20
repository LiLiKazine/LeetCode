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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        guard var node = head else {
            return
        }
        var sentry = ListNode(0, node)
        var nodes = [node]
        while node.next != nil {
            node = node.next!
            nodes.append(node)
        }
        while !nodes.isEmpty {
            if nodes.count > 1 {
                let head = nodes.removeFirst()
                let tail = nodes.removeLast()
                sentry.next = head
                head.next = tail
                tail.next = nil
                sentry = tail
            } else {
                let node = nodes.removeFirst()
                node.next = nil
                sentry.next = node
            }
        }
    }
}

//: [Next](@next)
