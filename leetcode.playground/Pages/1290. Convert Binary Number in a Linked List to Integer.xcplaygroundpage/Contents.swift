//: [Previous](@previous)

/*
 1290. Convert Binary Number in a Linked List to Integer
 简单
 Given head which is a reference node to a singly-linked list. The value of each node in the linked list is either 0 or 1. The linked list holds the binary representation of a number.

 Return the decimal value of the number in the linked list.

 The most significant bit is at the head of the linked list.

  

 Example 1:


 Input: head = [1,0,1]
 Output: 5
 Explanation: (101) in base 2 = (5) in base 10
 Example 2:

 Input: head = [0]
 Output: 0
  

 Constraints:

 The Linked List is not empty.
 Number of nodes will not exceed 30.
 Each node's value is either 0 or 1.
 
 1/5
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
    func getDecimalValue(_ head: ListNode?) -> Int {
        var n = 0
        var node = head
        while node != nil {
            n = n << 1 + node!.val
            node = node?.next
        }
        return n
    }
}

//: [Next](@next)
