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
        if head == nil || head?.next == nil { return head }
        var fast = head?.next?.next, slow = head
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        let l1 = head, l2 = slow?.next
        slow?.next = nil
        return merge(sortList(l1), sortList(l2))
    }
    
    
    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let sentry = ListNode(0)
        var cur: ListNode? = sentry, l1 = l1, l2 = l2
        while l1 != nil || l2 != nil {
            if l1 == nil {
                cur?.next = l2
                break
            }
            if l2 == nil {
                cur?.next = l1
                break
            }
            
            if l1!.val < l2!.val {
                cur?.next = l1
                l1 = l1?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
            }
            cur = cur?.next
        }
        return sentry.next
    }
}

//: [Next](@next)
