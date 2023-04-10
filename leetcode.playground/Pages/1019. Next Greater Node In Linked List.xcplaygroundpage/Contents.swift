//: [Previous](@previous)

/*
 
 1019. Next Greater Node In Linked List
 
 You are given the head of a linked list with n nodes.

 For each node in the list, find the value of the next greater node. That is, for each node, find the value of the first node that is next to it and has a strictly larger value than it.

 Return an integer array answer where answer[i] is the value of the next greater node of the ith node (1-indexed). If the ith node does not have a next greater node, set answer[i] = 0.

  

 Example 1:


 Input: head = [2,1,5]
 Output: [5,5,0]
 Example 2:


 Input: head = [2,7,4,3,5]
 Output: [7,0,5,5,0]
  

 Constraints:

 The number of nodes in the list is n.
 1 <= n <= 104
 1 <= Node.val <= 109
 
 */

class Solution {
    func nextLargerNodes(_ head: ListNode?) -> [Int] {
        
        var ans: [Int] = []
        
        let sentry = ListNode()
        
        var current = head
        
        while let node = current {
            current = node.next
            let temp = sentry.next
            sentry.next = node
            node.next = temp
        }
        
        var stack: [Int] = []
                
        var pointer = sentry.next
        
        while let node = pointer {
            
            pointer = pointer?.next
            
            while let top = stack.popLast() {
                if node.val < top {
                    ans.append(top)
                    stack.append(top)
                    stack.append(node.val)
                    break
                }
            }
            if stack.isEmpty {
                ans.append(0)
                stack.append(node.val)
            }
        }
        return ans.reversed()

    }
}

//let head = buildListNode([2,1,5])
//let head = buildListNode([2, 7, 4, 3, 5])
let head = buildListNode([1,7,5,1,9,2,5,1])
let solution = Solution()
let ans = solution.nextLargerNodes(head)

print(ans)
//[7,9,9,9,0,5,0,0]

//: [Next](@next)
