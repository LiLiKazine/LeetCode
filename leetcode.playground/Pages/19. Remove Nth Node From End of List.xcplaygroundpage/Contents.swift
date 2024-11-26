//: [Previous](@previous)

/*
 
 19. Remove Nth Node From End of List
 
 Given the head of a linked list, remove the nth node from the end of the list and return its head.
 
 Follow up: Could you do this in one pass?
 
 
 
 Example 1:
 
 
 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 Example 2:
 
 Input: head = [1], n = 1
 Output: []
 Example 3:
 
 Input: head = [1,2], n = 1
 Output: [1]
 
 
 Constraints:
 
 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var tail = head
        for _ in 0..<n {
            tail = tail?.next
        }
        let sentry = ListNode(0, head)
        var prev: ListNode? = sentry
        while tail != nil {
            tail = tail?.next
            prev = prev?.next
        }
        prev?.next = prev?.next?.next
        return sentry.next
    }
}

let root = ListNode(1)
root.next = ListNode(2)
root.next?.next = ListNode(3)
//root.next?.next?.next = ListNode(4)
//root.next?.next?.next?.next = ListNode(5)

let solution = Solution()
let ans = solution.removeNthFromEnd(root, 1)
ans

//: [Next](@next)
