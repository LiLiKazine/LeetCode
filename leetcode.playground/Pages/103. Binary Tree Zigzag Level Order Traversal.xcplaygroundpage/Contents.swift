//: [Previous](@previous)

/*
 
 103. Binary Tree Zigzag Level Order Traversal
 
 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its zigzag level order traversal as:
 [
   [3],
   [20,9],
   [15,7]
 ]
 
 */

class Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var isOdd = true, queue = [root], ans: [[Int]] = []
        
        while queue.count > 0 {
            var vals = [Int]()
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                vals.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            ans.append(isOdd ? vals : vals.reversed())
            isOdd.toggle()
        }
        return ans
    }
}

//: [Next](@next)
