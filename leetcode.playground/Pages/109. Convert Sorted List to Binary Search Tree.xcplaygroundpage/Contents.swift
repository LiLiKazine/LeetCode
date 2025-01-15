//: [Previous](@previous)

/*
 109. Convert Sorted List to Binary Search Tree
 中等
 Given the head of a singly linked list where elements are sorted in ascending order, convert it to a
 height-balanced
  binary search tree.

  

 Example 1:


 Input: head = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: One possible answer is [0,-3,9,-10,null,5], which represents the shown height balanced BST.
 Example 2:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in head is in the range [0, 2 * 104].
 -105 <= Node.val <= 105
 */

import Foundation

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard let head else { return nil }
        let sentry = ListNode(0)
        sentry.next = head
        var fast: ListNode? = sentry, slow: ListNode? = sentry
        
        while fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        let next = slow!.next!
        slow?.next = nil
        let nextNext = next.next
        next.next = nil
        let root = TreeNode(next.val)
        if head !== next {
            root.left = sortedListToBST(head)
        }
        root.right = sortedListToBST(nextNext)
        return root
    }
}

//: [Next](@next)
