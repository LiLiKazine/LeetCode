//: [Previous](@previous)

/*
 
 203. Remove Linked List Elements
 
 Given the head of a linked list and an integer val, remove all the nodes of the linked list that has Node.val == val, and return the new head.

  

 Example 1:


 Input: head = [1,2,6,3,4,5,6], val = 6
 Output: [1,2,3,4,5]
 Example 2:

 Input: head = [], val = 1
 Output: []
 Example 3:

 Input: head = [7,7,7,7], val = 7
 Output: []
  

 Constraints:

 The number of nodes in the list is in the range [0, 104].
 1 <= Node.val <= 50
 0 <= k <= 50
 
 */

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        let dummy = ListNode(0)
        dummy.next = head
        var p: ListNode? = dummy
        while p?.next != nil {
            if p!.next!.val == val {
                p?.next = p?.next?.next
            } else {
                p = p?.next
            }
        }
        
        return dummy.next
    }
}

//: [Next](@next)
