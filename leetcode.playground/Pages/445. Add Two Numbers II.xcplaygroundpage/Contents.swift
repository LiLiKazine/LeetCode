//: [Previous](@previous)

/*
 
 445. Add Two Numbers II
 
 You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Follow up:
 What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

 Example:

 Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 8 -> 0 -> 7
 
 */

import Foundation


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack1: [ListNode] = [], stack2: [ListNode] = [], l1 = l1, l2 = l2
        while l1 != nil {
            stack1.append(l1!)
            l1 = l1?.next
        }
        while l2 != nil {
            stack2.append(l2!)
            l2 = l2?.next
        }
        var temp: Int = 0
        var res: [Int] = []
        while !stack1.isEmpty || !stack2.isEmpty {
            let v1 = stack1.popLast()?.val ?? 0, v2 = stack2.popLast()?.val ?? 0
            let val = (temp + v1 + v2) % 10
            temp = (temp + v1 + v2) / 10
            res.insert(val, at: 0)
        }
        if temp != 0 {
            res.insert(temp, at: 0)
        }
        var ans: ListNode?, tail: ListNode?
        for val in res {
            if ans == nil {
                ans = ListNode(val)
                tail = ans
            } else {
                let node = ListNode(val)
                tail?.next = node
                tail = tail?.next
            }
        }
        return ans
    }
}

//: [Next](@next)
