//: [Previous](@previous)

/*
 1836. Remove Duplicates From an Unsorted Linked List
 中等
 Given the head of a linked list, find all the values that appear more than once in the list and delete the nodes that have any of those values.

 Return the linked list after the deletions.

  

 Example 1:


 Input: head = [1,2,3,2]
 Output: [1,3]
 Explanation: 2 appears twice in the linked list, so all 2's should be deleted. After deleting all 2's, we are left with [1,3].
 Example 2:


 Input: head = [2,1,1,2]
 Output: []
 Explanation: 2 and 1 both appear twice. All the elements should be deleted.
 Example 3:


 Input: head = [3,2,2,1,3,2,4]
 Output: [1,4]
 Explanation: 3 appears twice and 2 appears three times. After deleting all 3's and 2's, we are left with [1,4].
  

 Constraints:

 The number of nodes in the list is in the range [1, 105]
 1 <= Node.val <= 105
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func deleteDuplicatesUnsorted(_ head: ListNode?) -> ListNode? {
        var cur = head, dict = [Int: Int]()
        while cur != nil {
            dict[cur!.val, default: 0] += 1
            cur = cur?.next
        }
        let sentry = ListNode(0, head)
        cur = sentry
        while cur?.next != nil {
            if dict[cur!.next!.val, default: 0] > 1 {
                cur?.next = cur?.next?.next
            } else {
                cur = cur?.next
            }
        }
        return sentry.next
    }
}

//: [Next](@next)
