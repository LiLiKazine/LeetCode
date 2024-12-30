//: [Previous](@previous)

/*
 968. Binary Tree Cameras
 困难
 You are given the root of a binary tree. We install cameras on the tree nodes where each camera at a node can monitor its parent, itself, and its immediate children.

 Return the minimum number of cameras needed to monitor all nodes of the tree.

  

 Example 1:


 Input: root = [0,0,null,0,0]
 Output: 1
 Explanation: One camera is enough to monitor all nodes if placed as shown.
 Example 2:


 Input: root = [0,0,null,0,null,0,null,null,0]
 Output: 2
 Explanation: At least two cameras are needed to monitor all nodes of the tree. The above image shows one of the valid configurations of camera placement.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 Node.val == 0
 */

import Foundation

class Solution {
    
    func minCameraCover(_ root: TreeNode?) -> Int {
        
        func dfs(_ p: TreeNode?) -> (Int, Int, Int) {
            guard let p else { return (1000, 0, 0) }
        
            let (l_installed, l_by_fa, l_by_child) = dfs(p.left)
            let (r_installed, r_by_fa, r_by_child) = dfs(p.right)
            let installed = min(l_installed, l_by_fa, l_by_child) + min(r_installed, r_by_fa, r_by_child) + 1
            let by_fa = min(l_installed, l_by_child) + min(r_installed, r_by_child)
            let by_child = min(l_installed + r_by_child, l_installed + r_installed, l_by_child + r_installed)
            return (installed, by_fa, by_child)
        }
    
        let (installed, _, by_child) = dfs(root)
        return min(installed, by_child)
    }
}

/*
 class Solution:
     def minCameraCover(self, root: Optional[TreeNode]) -> int:
         def dfs(node):
             if node is None:
                 return inf, 0, 0  # 空节点不能安装摄像头，也无需被监控到
             l_choose, l_by_fa, l_by_children = dfs(node.left)
             r_choose, r_by_fa, r_by_children = dfs(node.right)
             choose = min(l_choose, l_by_fa) + min(r_choose, r_by_fa) + 1
             by_fa = min(l_choose, l_by_children) + min(r_choose, r_by_children)
             by_children = min(l_choose + r_by_children, l_by_children + r_choose, l_choose + r_choose)
             return choose, by_fa, by_children
         choose, _, by_children = dfs(root)  # 根节点没有父节点
         return min(choose, by_children)
 */

//: [Next](@next)
