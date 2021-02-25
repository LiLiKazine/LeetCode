//: [Previous](@previous)

/*
 
 404. Sum of Left Leaves
 
 Find the sum of all left leaves in a given binary tree.

 Example:

     3
    / \
   9  20
     /  \
    15   7

 There are two left leaves in the binary tree, with values 9 and 15 respectively. Return 24.
 
 */


class Solution {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        return leftVal(root)
    }
    
    private func leftVal(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }
        var val = 0
        if let left = node.left, left.left == nil, left.right == nil {
            val = left.val
        }
        return val + leftVal(node.left) + leftVal(node.right)
    }
}

let tree = buildTreeNode([1,2,3,4,5])
let solution = Solution()
let ans = solution.sumOfLeftLeaves(tree)
ans



//: [Next](@next)
