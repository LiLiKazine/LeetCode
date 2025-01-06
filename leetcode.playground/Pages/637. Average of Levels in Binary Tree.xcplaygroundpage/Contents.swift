//: [Previous](@previous)

/*
 
 637. Average of Levels in Binary Tree
 
 Given a non-empty binary tree, return the average value of the nodes on each level in the form of an array.
 Example 1:
 Input:
 3
 / \
 9  20
 /  \
 15   7
 Output: [3, 14.5, 11]
 Explanation:
 The average value of nodes on level 0 is 3,  on level 1 is 14.5, and on level 2 is 11. Hence return [3, 14.5, 11].
 Note:
 The range of node's value is in the range of 32-bit signed integer.
 
 */


class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root else { return [] }
        var ans = [Double]()
        var queue = [root]
        
        while queue.count > 0 {
            let size = queue.count
            var sum = 0
            
            for _ in 0..<size {
                let node = queue.removeFirst()
                sum += node.val
                
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            ans.append(Double(sum) / Double(size))
        }
        return ans
    }
}

//: [Next](@next)
