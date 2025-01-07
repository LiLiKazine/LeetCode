//: [Previous](@previous)

/*
 
 1302. Deepest Leaves Sum
 
 Given a binary tree, return the sum of values of its deepest leaves.
 
 
 Example 1:
 
 
 
 Input: root = [1,2,3,4,5,null,6,7,null,null,null,null,8]
 Output: 15
 
 
 Constraints:
 
 The number of nodes in the tree is between 1 and 10^4.
 The value of nodes is between 1 and 100.
 
 */

class Solution {
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        var maxd: Int = 0, ans = 0
        
        func dfs(_ node: TreeNode?, _ depth: Int) {
            guard let node else { return }
            if depth > maxd {
                maxd = depth
                ans = 0
            }
            if depth == maxd { ans += node.val }
            dfs(node.left, depth + 1)
            dfs(node.right, depth + 1)
        }
        dfs(root, 0)
        return ans
    }
}

//: [Next](@next)
