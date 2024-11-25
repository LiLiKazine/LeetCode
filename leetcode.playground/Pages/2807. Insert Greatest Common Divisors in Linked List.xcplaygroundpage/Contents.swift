//: [Previous](@previous)

/*
 2807. Insert Greatest Common Divisors in Linked List
 中等
 Given the head of a linked list head, in which each node contains an integer value.

 Between every pair of adjacent nodes, insert a new node with a value equal to the greatest common divisor of them.

 Return the linked list after insertion.

 The greatest common divisor of two numbers is the largest positive integer that evenly divides both numbers.

  

 Example 1:


 Input: head = [18,6,10,3]
 Output: [18,6,6,2,10,1,3]
 Explanation: The 1st diagram denotes the initial linked list and the 2nd diagram denotes the linked list after inserting the new nodes (nodes in blue are the inserted nodes).
 - We insert the greatest common divisor of 18 and 6 = 6 between the 1st and the 2nd nodes.
 - We insert the greatest common divisor of 6 and 10 = 2 between the 2nd and the 3rd nodes.
 - We insert the greatest common divisor of 10 and 3 = 1 between the 3rd and the 4th nodes.
 There are no more adjacent nodes, so we return the linked list.
 Example 2:


 Input: head = [7]
 Output: [7]
 Explanation: The 1st diagram denotes the initial linked list and the 2nd diagram denotes the linked list after inserting the new nodes.
 There are no pairs of adjacent nodes, so we return the initial linked list.
  

 Constraints:

 The number of nodes in the list is in the range [1, 5000].
 1 <= Node.val <= 1000
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
    func insertGreatestCommonDivisors(_ head: ListNode?) -> ListNode? {
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        var cur = head
        while cur?.next != nil {
            let a = cur!.val, b = cur!.next!.val
            let node = ListNode(gcd(a, b))
            let next = cur?.next
            cur?.next = node
            node.next = next
            cur = next
        }
        return head
    }
}

//: [Next](@next)
