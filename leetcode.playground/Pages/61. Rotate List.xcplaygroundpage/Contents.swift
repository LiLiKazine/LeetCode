//: [Previous](@previous)

/*
 
 61. Rotate List
 
 Given the head of a linked list, rotate the list to the right by k places.

  

 Example 1:


 Input: head = [1,2,3,4,5], k = 2
 Output: [4,5,1,2,3]
 Example 2:


 Input: head = [0,1,2], k = 4
 Output: [2,0,1]
  

 Constraints:

 The number of nodes in the list is in the range [0, 500].
 -100 <= Node.val <= 100
 0 <= k <= 2 * 109
 
 */

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var nodes: [ListNode] = [], node = head
        while node != nil {
            nodes.append(node!)
            node = node?.next
        }
        if nodes.count <= 1 {
            return head
        }
        let count = nodes.count, offset = k % count
        if offset == 0 {
            return head
        }
        let newHead = nodes[count - offset]
        nodes.last?.next = head
        nodes[count - offset - 1].next = nil
        return newHead
    }
}

//: [Next](@next)
