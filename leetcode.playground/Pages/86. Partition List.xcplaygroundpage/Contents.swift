//: [Previous](@previous)

/*
 
 86. Partition List
 
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

 You should preserve the original relative order of the nodes in each of the two partitions.

 Example:

 Input: head = 1->4->3->2->5->2, x = 3
 Output: 1->2->2->4->3->5
 
 */

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let sentrySmall = ListNode(0), sentryLarge = ListNode(0)
        var sTail: ListNode? = sentrySmall, lTail: ListNode? = sentryLarge
        var cur = head
        while cur != nil {
            let val = cur!.val
            if val < x {
                sTail?.next = cur
                sTail = cur
            } else {
                lTail?.next = cur
                lTail = cur
            }
            cur = cur?.next
        }
        lTail?.next = nil
        sTail?.next = sentryLarge.next
        return sentrySmall.next
    }
}

let node = buildListNode([1,4,3,2,5,2])

let solution = Solution()
let ans = solution.partition(node, 3)
let output = stringListNode(ans)
output

//: [Next](@next)
