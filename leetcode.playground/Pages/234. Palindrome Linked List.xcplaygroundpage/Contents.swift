//: [Previous](@previous)

/*
 
 234. Palindrome Linked List
 
 Given a singly linked list, determine if it is a palindrome.
 
 Example 1:
 
 Input: 1->2
 Output: false
 Example 2:
 
 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head?.next == nil {
            return true
        }
        var sentry: ListNode?
        var fast = head, slow = head
        while fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        sentry = slow
        let tail = sentry?.next
        while tail?.next != nil {
            let temp = sentry?.next
            sentry?.next = tail?.next
            tail?.next = tail?.next?.next
            sentry?.next?.next = temp
        }
        fast = slow?.next
        slow = head
        while fast != nil && slow != nil {
            if fast?.val == slow?.val {
                fast = fast?.next
                slow = slow?.next
                continue
            }
            return false
        }
        return true
    }
}
//[1,3,2,4,3,2,1]
let root = ListNode(1)
root.next = ListNode(3)
root.next?.next = ListNode(2)
root.next?.next?.next = ListNode(4)
root.next?.next?.next?.next = ListNode(3)
root.next?.next?.next?.next?.next = ListNode(2)
root.next?.next?.next?.next?.next?.next = ListNode(1)
let solution = Solution()
let ans = solution.isPalindrome(root)
ans
//: [Next](@next)
