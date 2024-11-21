//: [Previous](@previous)

/*
 725. Split Linked List in Parts
 中等
 Given the head of a singly linked list and an integer k, split the linked list into k consecutive linked list parts.

 The length of each part should be as equal as possible: no two parts should have a size differing by more than one. This may lead to some parts being null.

 The parts should be in the order of occurrence in the input list, and parts occurring earlier should always have a size greater than or equal to parts occurring later.

 Return an array of the k parts.

  

 Example 1:


 Input: head = [1,2,3], k = 5
 Output: [[1],[2],[3],[],[]]
 Explanation:
 The first element output[0] has output[0].val = 1, output[0].next = null.
 The last element output[4] is null, but its string representation as a ListNode is [].
 Example 2:


 Input: head = [1,2,3,4,5,6,7,8,9,10], k = 3
 Output: [[1,2,3,4],[5,6,7],[8,9,10]]
 Explanation:
 The input has been split into consecutive parts with size difference at most 1, and earlier parts are a larger size than the later parts.
  

 Constraints:

 The number of nodes in the list is in the range [0, 1000].
 0 <= Node.val <= 1000
 1 <= k <= 50
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
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        var ans = [ListNode?]()
        
        let len : Int = {
            var cur = head, len = 0
            while cur != nil {
                cur = cur?.next
                len += 1
            }
            return len
        }()
        
        let s = len / k
        var r = len % k
        var sentry: ListNode? = ListNode(0, head), cur = sentry
        while cur?.next != nil {
            for _ in 0..<s {
                cur = cur?.next
            }
            if r > 0 {
                r -= 1
                cur = cur?.next
            }
            ans.append(sentry?.next)
            sentry?.next = cur?.next
            cur?.next = nil
            cur = sentry
        }
        if ans.count < k {
            ans.append(contentsOf: Array(repeating: ListNode?.none, count: k - ans.count))
        }
        return ans
    }
}

//: [Next](@next)
