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
//        var filtered = lists.compactMap{ $0 }
//        return stupid(&filtered)
//        var ans: ListNode?
//        for i in 0..<lists.count {
//            var node = lists[i]
//            ans = merge(&ans, &node)
//        }
//        return ans
        var variable = lists
        return divide(&variable)
    }
    
    func divide( _ lists: inout [ListNode?]) -> ListNode? {
        if lists.count < 2 {
            return lists.first ?? nil
        }
        if lists.count == 2 {
            var node1 = lists[0], node2 = lists[1]
            return merge(&node1, &node2)
        }
        var nextLists: [ListNode?] = []
        while !lists.isEmpty {
            var n1 = lists.popLast() ?? nil
            var n2 = lists.popLast() ?? nil
            nextLists.append(merge(&n1, &n2))
        }
        return divide(&nextLists)
    }
    
    func merge(_ node1: inout ListNode?, _ node2: inout ListNode?) -> ListNode? {
        if node1 == nil || node2 == nil {
            return node1 == nil ? node2 : node1
        }
        var head = ListNode(0), tail = head
        while node1 != nil || node2 != nil {
            if let v1 = node1?.val, let v2 = node2?.val {
                if v1 > v2 {
                    tail.next = ListNode(v2)
                    node2 = node2?.next
                } else {
                    tail.next = ListNode(v1)
                    node1 = node1?.next
                }
                tail = tail.next!
            } else {
                if node1 == nil {
                    tail.next = node2
                } else {
                    tail.next = node1
                }
                break
            }
        }
        return head.next
    }
    
    func stupid(_ lists: inout [ListNode]) -> ListNode? {
        var head: ListNode?, tail: ListNode?
        while !lists.isEmpty {
            var idx = 0
            for i in 0..<lists.count {
                let val = lists[i].val
                if val < lists[idx].val {
                    idx = i
                }
            }
            if head == nil {
                head = ListNode(lists[idx].val)
                tail = head
            } else {
                tail?.next = ListNode(lists[idx].val)
                tail = tail?.next
            }
            if let next = lists[idx].next {
                lists[idx] = next
            } else {
                lists.remove(at: idx)
            }
        }
        return head
    }
}

//: [Next](@next)
