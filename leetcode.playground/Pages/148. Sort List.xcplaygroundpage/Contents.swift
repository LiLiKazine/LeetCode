//: [Previous](@previous)

/*
 
 148. Sort List
 
 Given the head of a linked list, return the list after sorting it in ascending order.
 
 Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?
 
 
 
 Example 1:
 
 
 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 Example 2:
 
 
 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
 Example 3:
 
 Input: head = []
 Output: []
 
 
 Constraints:
 
 The number of nodes in the list is in the range [0, 5 * 104].
 -105 <= Node.val <= 105
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }
        var len = 0, cur: ListNode? = head
        while cur != nil {
            len += 1
            cur = cur?.next
        }
        return sortList(head, len: len)
    }
    
    func sortList(_ head: ListNode, len: Int) -> ListNode {
        
        if len > 2 {
            let half = len / 2
            var prev: ListNode? = nil, node = head, leftover = half
            while leftover > 0, let next = node.next {
                prev = node
                node = next
                leftover -= 1
            }
            prev?.next = nil
            let part1 = sortList(head, len: half)
            let part2 = sortList(node, len: len - half)
            return merge(part1, part2)
        } else if let next = head.next {
            if next.val < head.val {
                next.next = head
                head.next = nil
                return next
            } else {
                next.next = nil
                return head
            }
        } else {
            return head
        }
    }
    
    func merge(_ node1: ListNode, _ node2: ListNode) -> ListNode {
        let sentry = ListNode(0)
        var tail = sentry
        var node1: ListNode? = node1, node2: ListNode? = node2
        while let v1 = node1?.val, let v2 = node2?.val {
            if v1 < v2 {
                tail.next = node1
                node1 = node1?.next
            } else {
                tail.next = node2
                node2 = node2?.next
            }
            tail = tail.next!
        }
        if node1 != nil {
            tail.next = node1
        } else {
            tail.next = node2
        }
        return sentry.next!
    }
}

//: [Next](@next)
