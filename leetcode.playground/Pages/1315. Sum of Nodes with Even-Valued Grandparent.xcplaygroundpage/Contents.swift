//: [Previous](@previous)

/*
 
 1315. Sum of Nodes with Even-Valued Grandparent
 
 Given a binary tree, return the sum of values of nodes with even-valued grandparent.  (A grandparent of a node is the parent of its parent, if it exists.)
 
 If there are no nodes with an even-valued grandparent, return 0.
 
 
 
 Example 1:
 
 
 
 Input: root = [6,7,8,2,7,1,3,9,null,1,4,null,null,null,5]
 Output: 18
 Explanation: The red nodes are the nodes with even-value grandparent while the blue nodes are the even-value grandparents.
 
 
 Constraints:
 
 The number of nodes in the tree is between 1 and 10^4.
 The value of nodes is between 1 and 100.
 
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        var ans = 0
        
        func dfs(_ node: TreeNode?, _ p: Int, _ gp: Int) {
            guard let node else { return }
            if gp % 2 == 0 {
                ans += node.val
            }
            dfs(node.left, node.val, p)
            dfs(node.right, node.val, p)
        }
        
        dfs(root, 1, 1)
        return ans
    }
    
}

//: [Next](@next)
