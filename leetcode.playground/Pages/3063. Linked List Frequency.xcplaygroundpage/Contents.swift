//: [Previous](@previous)

/*
 
 3063. Linked List Frequency
 简单
 Given the head of a linked list containing k distinct elements, return the head to a linked list of length k containing the
 frequency
  of each distinct element in the given linked list in any order.

  

 Example 1:

 Input: head = [1,1,2,1,2,3]

 Output: [3,2,1]

 Explanation: There are 3 distinct elements in the list. The frequency of 1 is 3, the frequency of 2 is 2 and the frequency of 3 is 1. Hence, we return 3 -> 2 -> 1.

 Note that 1 -> 2 -> 3, 1 -> 3 -> 2, 2 -> 1 -> 3, 2 -> 3 -> 1, and 3 -> 1 -> 2 are also valid answers.

 Example 2:

 Input: head = [1,1,2,2,2]

 Output: [2,3]

 Explanation: There are 2 distinct elements in the list. The frequency of 1 is 2 and the frequency of 2 is 3. Hence, we return 2 -> 3.

 Example 3:

 Input: head = [6,5,4,3,2,1]

 Output: [1,1,1,1,1,1]

 Explanation: There are 6 distinct elements in the list. The frequency of each of them is 1. Hence, we return 1 -> 1 -> 1 -> 1 -> 1 -> 1.

  

 Constraints:

 The number of nodes in the list is in the range [1, 105].
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
    func frequenciesOfElements(_ head: ListNode?) -> ListNode? {
        
        var freq = [Int: Int]()
        var cur = head
        while cur != nil {
            freq[cur!.val, default: 0] += 1
            cur = cur?.next
        }
        var sentry: ListNode? = ListNode()
        cur = sentry
        for (_, v) in freq {
            cur?.next = ListNode(v)
            cur = cur?.next
        }
        return sentry?.next
    }
}

//: [Next](@next)
