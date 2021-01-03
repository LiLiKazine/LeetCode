//: [Previous](@previous)

/*
 
 86. Partition List
 
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

 You should preserve the original relative order of the nodes in each of the two partitions.

 Example:

 Input: head = 1->4->3->2->5->2, x = 3
 Output: 1->2->2->4->3->5
 
 */
//
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}
 
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let sentrySmall = ListNode(0), sentryLarge = ListNode(0)
        sentrySmall.next = head
        
        var small: ListNode? = sentrySmall, large: ListNode? = sentryLarge
        while small?.next != nil {
            if small!.next!.val >= x {
                large?.next = small?.next
                large = large?.next
                small?.next = large?.next
                large?.next = nil
            } else {
                small = small?.next
            }
        }
        
        small?.next = sentryLarge.next
        return sentrySmall.next
    }
}

let node = buildListNode([1,4,3,2,5,2])

let solution = Solution()
let ans = solution.partition(node, 3)
let output = stringListNode(ans)
output

//: [Next](@next)
