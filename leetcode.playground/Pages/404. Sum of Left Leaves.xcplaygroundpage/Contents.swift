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
        var ans = 0
    
        func dfs(_ node: TreeNode?, isLeft: Bool = false) {
            guard let node else { return }
            if node.left == nil && node.right == nil && isLeft {
                ans += node.val
            }
            dfs(node.left, isLeft: true)
            dfs(node.right)
        }
        
        dfs(root)
        return ans
    }
    
}

let tree = buildTreeNode([1,2,3,4,5])
let solution = Solution()
let ans = solution.sumOfLeftLeaves(tree)
ans



//: [Next](@next)
