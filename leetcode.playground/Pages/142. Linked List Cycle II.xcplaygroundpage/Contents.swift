//: [Previous](@previous)

/*
 
 142. Linked List Cycle II
 
 Given a linked list, return the node where the cycle begins. If there is no cycle, return null.
 
 There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.
 
 Notice that you should not modify the linked list.
 
 Follow up:
 
 Can you solve it using O(1) (i.e. constant) memory?
 
 
 
 Example 1:
 
 
 Input: head = [3,2,0,-4], pos = 1
 Output: tail connects to node index 1
 Explanation: There is a cycle in the linked list, where tail connects to the second node.
 Example 2:
 
 
 Input: head = [1,2], pos = 0
 Output: tail connects to node index 0
 Explanation: There is a cycle in the linked list, where tail connects to the first node.
 Example 3:
 
 
 Input: head = [1], pos = -1
 Output: no cycle
 Explanation: There is no cycle in the linked list.
 
 
 Constraints:
 
 The number of the nodes in the list is in the range [0, 104].
 -105 <= Node.val <= 105
 pos is -1 or a valid index in the linked-list.
 
 
 根据题意，任意时刻，fast 指针走过的距离都为 slow 指针的 2 倍。因此，我们有

 a+(n+1)b+nc=2(a+b)⟹a=c+(n−1)(b+c)

 有了 a=c+(n−1)(b+c) 的等量关系，我们会发现：从相遇点到入环点的距离加上 n−1 圈的环长，恰好等于从链表头部到入环点的距离。

 因此，当发现 slow 与 fast 相遇时，我们再额外使用一个指针 ptr。起始，它指向链表头部；随后，它和 slow 每次向后移动一个位置。最终，它们会在入环点相遇。

 public class Solution {
     public ListNode detectCycle(ListNode head) {
         if (head == null) {
             return null;
         }
         ListNode slow = head, fast = head;
         while (fast != null) {
             slow = slow.next;
             if (fast.next != null) {
                 fast = fast.next.next;
             } else {
                 return null;
             }
             if (fast == slow) {
                 ListNode ptr = head;
                 while (ptr != slow) {
                     ptr = ptr.next;
                     slow = slow.next;
                 }
                 return ptr;
             }
         }
         return null;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/linked-list-cycle-ii/solution/huan-xing-lian-biao-ii-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head, slow = head
        while fast?.next?.next != nil && slow?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast !== slow {
                continue
            }
            var ptr = head
            while ptr !== slow {
                print(ptr!.val, slow!.val)
                ptr = ptr?.next
                slow = slow?.next
            }
            return ptr
        }
        return nil
    }
}



//: [Next](@next)
