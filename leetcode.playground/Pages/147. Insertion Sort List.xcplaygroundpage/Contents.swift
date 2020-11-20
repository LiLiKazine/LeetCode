//: [Previous](@previous)

/*
 
 147. Insertion Sort List
 
 Sort a linked list using insertion sort.


 A graphical example of insertion sort. The partial sorted list (black) initially contains only the first element in the list.
 With each iteration one element (red) is removed from the input data and inserted in-place into the sorted list
  

 Algorithm of Insertion Sort:

 Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
 At each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list, and inserts it there.
 It repeats until no input elements remain.

 Example 1:

 Input: 4->2->1->3
 Output: 1->2->3->4
 Example 2:

 Input: -1->5->3->4->0
 Output: -1->0->3->4->5
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/*
 
 
 class Solution {
     public ListNode insertionSortList(ListNode head) {
         if (head == null) {
             return head;
         }
         ListNode dummyHead = new ListNode(0);
         dummyHead.next = head;
         ListNode lastSorted = head, curr = head.next;
         while (curr != null) {
             if (lastSorted.val <= curr.val) {
                 lastSorted = lastSorted.next;
             } else {
                 ListNode prev = dummyHead;
                 while (prev.next.val <= curr.val) {
                     prev = prev.next;
                 }
                 lastSorted.next = curr.next;
                 curr.next = prev.next;
                 prev.next = curr;
             }
             curr = lastSorted.next;
         }
         return dummyHead.next;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/insertion-sort-list/solution/dui-lian-biao-jin-xing-cha-ru-pai-xu-by-leetcode-s/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */
 
class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        var sentry: ListNode? = ListNode(0), tail = head, cur = head?.next
        sentry?.next = head
        
        while cur != nil {
            if tail!.val <= cur!.val {
                tail = tail?.next
            } else {
                var node = sentry, next = node?.next
                while next!.val < cur!.val {
                    node = node?.next
                    next = node?.next
                }
                tail?.next = cur?.next
                node?.next = cur
                cur?.next = next
            }
            cur = tail?.next
        }
        return sentry?.next
    }
}

//: [Next](@next)
