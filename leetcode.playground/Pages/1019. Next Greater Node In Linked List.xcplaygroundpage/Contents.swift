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
        var stk = [Int](), cur = head
        while cur != nil {
            stk.append(cur!.val)
            cur = cur?.next
        }
        let n = stk.count
        var mono = [stk[n-1]]
        stk[n-1] = 0
        for i in stride(from: n - 2, through: 0, by: -1) {
            let cur = stk[i]
            while mono.count > 0 && mono[0] <= cur {
                mono.removeFirst()
            }
            if mono.isEmpty {
                stk[i] = 0
            } else {
                stk[i] = mono[0]
            }
            mono.insert(cur, at: 0)
        }
        return stk
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
