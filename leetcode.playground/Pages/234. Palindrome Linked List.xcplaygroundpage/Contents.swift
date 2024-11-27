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


class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        var slow = head, fast = head
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
        var n1 = head, n2 = prev
        while n2 != nil {
            if n1!.val != n2!.val {
                return false
            }
            n1 = n1?.next
            n2 = n2?.next
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
