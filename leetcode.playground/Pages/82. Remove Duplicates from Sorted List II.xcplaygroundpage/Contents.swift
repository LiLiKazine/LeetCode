//: [Previous](@previous)

/*
 
 82. Remove Duplicates from Sorted List II
 
 Given a sorted linked list, delete all nodes that have duplicate numbers, leaving only distinct numbers from the original list.

 Return the linked list sorted as well.

 Example 1:

 Input: 1->2->3->3->4->4->5
 Output: 1->2->5
 Example 2:

 Input: 1->1->1->2->3
 Output: 2->3
 
 */

/*
 
 ListNode* deleteDuplicates(ListNode* head) {
         ListNode* p=new ListNode(0);
         p->next=head;
         head=p;
         ListNode *left,*right;
         while(p->next)
         {
             left=p->next;
             right=left;
             while(right->next && right->next->val==left->val)
                 right=right->next;
             if(left == right) p=p->next;
             else p->next=right->next;
         }
         return head->next;
     }
 
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var sentry: ListNode = ListNode(0), pointer: ListNode? = sentry
        sentry.next = head
        while pointer?.next != nil {
            let left = pointer?.next
            var right = left
            while right?.next != nil && right?.next?.val == left?.val {
                right = right?.next
            }
            if left === right {
                pointer = pointer?.next
            } else {
                pointer?.next = right?.next
            }
        }
        return sentry.next
    }
}

let head = ListNode(1)
head.next = .init(2)
head.next?.next = .init(3)
head.next?.next?.next = .init(3)
head.next?.next?.next?.next = .init(4)
head.next?.next?.next?.next?.next = .init(4)
head.next?.next?.next?.next?.next?.next = .init(5)

let solution = Solution()
let ans = solution.deleteDuplicates(head)
ans

/*
 
 [1,2,3,3,4,4,5]
 输出：
 [1,2,3,4,5]
 预期结果：
 [1,2,5]
 
 */

//: [Next](@next)
