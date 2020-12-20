//: [Previous](@previous)

/*
 
 148. Sort List
 
 Given the head of a linked list, return the list after sorting it in ascending order.
 
 Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?
 
 
 
 Example 1:
 
 
 Input: head = [4,2,1,3]
 Output: [1,2,3,4]
 Example 2:
 
 
 Input: head = [-1,5,3,4,0]
 Output: [-1,0,3,4,5]
 Example 3:
 
 Input: head = []
 Output: []
 
 
 Constraints:
 
 The number of nodes in the list is in the range [0, 5 * 104].
 -105 <= Node.val <= 105
 
 */

/*
 
 class Solution {
     public ListNode sortList(ListNode head) {
         if (head == null) {
             return head;
         }
         int length = 0;
         ListNode node = head;
         while (node != null) {
             length++;
             node = node.next;
         }
         ListNode dummyHead = new ListNode(0, head);
         for (int subLength = 1; subLength < length; subLength <<= 1) {
             ListNode prev = dummyHead, curr = dummyHead.next;
             while (curr != null) {
                 ListNode head1 = curr;
                 for (int i = 1; i < subLength && curr.next != null; i++) {
                     curr = curr.next;
                 }
                 ListNode head2 = curr.next;
                 curr.next = null;
                 curr = head2;
                 for (int i = 1; i < subLength && curr != null && curr.next != null; i++) {
                     curr = curr.next;
                 }
                 ListNode next = null;
                 if (curr != null) {
                     next = curr.next;
                     curr.next = null;
                 }
                 ListNode merged = merge(head1, head2);
                 prev.next = merged;
                 while (prev.next != null) {
                     prev = prev.next;
                 }
                 curr = next;
             }
         }
         return dummyHead.next;
     }

     public ListNode merge(ListNode head1, ListNode head2) {
         ListNode dummyHead = new ListNode(0);
         ListNode temp = dummyHead, temp1 = head1, temp2 = head2;
         while (temp1 != null && temp2 != null) {
             if (temp1.val <= temp2.val) {
                 temp.next = temp1;
                 temp1 = temp1.next;
             } else {
                 temp.next = temp2;
                 temp2 = temp2.next;
             }
             temp = temp.next;
         }
         if (temp1 != null) {
             temp.next = temp1;
         } else if (temp2 != null) {
             temp.next = temp2;
         }
         return dummyHead.next;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/sort-list/solution/pai-xu-lian-biao-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        var length = 0, node = head
        while node != nil {
            node = node?.next
            length += 1
        }
        guard length > 0 else {
            return head
        }
        let sentry = ListNode(0, head!)
        var i = 1
        while i < length {
            <#code#>
        }
        return nil
    }
}

//: [Next](@next)
