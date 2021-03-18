//: [Previous](@previous)

/*
 
 92. Reverse Linked List II
 
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.

  

 Example 1:


 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]
 Example 2:

 Input: head = [5], left = 1, right = 1
 Output: [5]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n
  

 Follow up: Could you do it in one pass?
 
 */

/*
 
 class Solution {
 public:
     ListNode *reverseBetween(ListNode *head, int left, int right) {
         // 设置 dummyNode 是这一类问题的一般做法
         ListNode *dummyNode = new ListNode(-1);
         dummyNode->next = head;
         ListNode *pre = dummyNode;
         for (int i = 0; i < left - 1; i++) {
             pre = pre->next;
         }
         ListNode *cur = pre->next;
         ListNode *next;
         for (int i = 0; i < right - left; i++) {
             next = cur->next;
             cur->next = next->next;
             next->next = pre->next;
             pre->next = next;
         }
         return dummyNode->next;
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/reverse-linked-list-ii/solution/fan-zhuan-lian-biao-ii-by-leetcode-solut-teyq/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */


class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var sentry = ListNode(0, head), pre: ListNode? = sentry
        for _ in 0..<left-1 {
            pre = pre?.next
        }
        var cur = pre?.next, next: ListNode?
        for _ in 0..<right - left {
            next = cur?.next
            cur?.next = next?.next
            next?.next = pre?.next
            pre?.next = next
        }
        
        return sentry.next
    }
}

//: [Next](@next)
