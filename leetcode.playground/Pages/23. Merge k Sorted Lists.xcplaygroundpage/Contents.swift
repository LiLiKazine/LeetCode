//: [Previous](@previous)

/*
 
 23. Merge k Sorted Lists
 
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.

 Example:

 Input:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 Output: 1->1->2->3->4->4->5->6
 
 */

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {

        func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let sentry = ListNode(0)
        var cur: ListNode? = sentry, l1 = l1, l2 = l2
        while l1 != nil || l2 != nil {
            if l1 == nil {
                cur?.next = l2
                break
            } else if l2 == nil {
                cur?.next = l1
                break
            } else if l1!.val < l2!.val {
                cur?.next = l1
                l1 = l1?.next
                cur = cur?.next
            } else {
                cur?.next = l2
                l2 = l2?.next
                cur = cur?.next
            }
        }
        return sentry.next
    }
        func merge(_ range: Range<Int>) -> ListNode? {
            let i = range.lowerBound, j = range.upperBound
            if i == j {
                return nil
            }
            if j - i == 1 {
                return lists[i]
            }
            if j - i == 2 {
                return merge(lists[i], lists[i+1])
            }
            let mid = i + (j - i) / 2
            return merge(merge(i..<mid), merge(mid..<j))
        }
        return merge(0..<lists.count)
    }
}

//: [Next](@next)
