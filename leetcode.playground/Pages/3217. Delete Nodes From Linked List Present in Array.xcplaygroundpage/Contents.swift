//: [Previous](@previous)

/*
 3217. Delete Nodes From Linked List Present in Array
 中等
 You are given an array of integers nums and the head of a linked list. Return the head of the modified linked list after removing all nodes from the linked list that have a value that exists in nums.

  

 Example 1:

 Input: nums = [1,2,3], head = [1,2,3,4,5]

 Output: [4,5]

 Explanation:



 Remove the nodes with values 1, 2, and 3.

 Example 2:

 Input: nums = [1], head = [1,2,1,2,1,2]

 Output: [2,2,2]

 Explanation:



 Remove the nodes with value 1.

 Example 3:

 Input: nums = [5], head = [1,2,3,4]

 Output: [1,2,3,4]

 Explanation:



 No node has value 5.

  

 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 105
 All elements in nums are unique.
 The number of nodes in the given list is in the range [1, 105].
 1 <= Node.val <= 105
 The input is generated such that there is at least one node in the linked list that has a value not present in nums.
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
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        var set = Set(nums)
        var sentry = ListNode(0, head)
        var cur = sentry
        while cur.next != nil {
            if set.contains(cur.next!.val) {
                cur.next = cur.next?.next
            } else {
                cur = cur.next!
            }
        }
        return sentry.next
    }
}

//: [Next](@next)
