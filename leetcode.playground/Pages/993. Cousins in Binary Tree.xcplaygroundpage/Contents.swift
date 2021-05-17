//: [Previous](@previous)

/*
 
 993. Cousins in Binary Tree
 
 In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.

 Two nodes of a binary tree are cousins if they have the same depth, but have different parents.

 We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.

 Return true if and only if the nodes corresponding to the values x and y are cousins.

  

 Example 1:


 Input: root = [1,2,3,4], x = 4, y = 3
 Output: false
 Example 2:


 Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
 Output: true
 Example 3:



 Input: root = [1,2,3,null,4], x = 2, y = 3
 Output: false
  

 Constraints:

 The number of nodes in the tree will be between 2 and 100.
 Each node has a unique integer value from 1 to 100.
 
 */

/*
 
 class Solution {
     public boolean isCousins(TreeNode root, int x, int y) {
         int[] xi = dfs(root, null, 0, x);
         int[] yi = dfs(root, null, 0, y);
         return xi[1] == yi[1] && xi[0] != yi[0];
     }
     int[] dfs(TreeNode root, TreeNode fa, int depth, int t) {
         if (root == null) return new int[]{-1, -1}; // 使用 -1 代表为搜索不到 t
         if (root.val == t) {
             return new int[]{fa != null ? fa.val : 1, depth}; // 使用 1 代表搜索值 t 为 root
         }
         int[] l = dfs(root.left, root, depth + 1, t);
         if (l[0] != -1) return l;
         return dfs(root.right, root, depth + 1, t);
     }
 }
 
 */

class Solution {
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        let xi = dfs(0, root, nil, x),
            yi = dfs(0, root, nil, y)
        return xi.0 != yi.0 && xi.1 == yi.1
        
    }
    
    private func dfs(_ depth: Int, _ node: TreeNode?, _ parent: TreeNode?, _ target: Int) -> (Int, Int) {
        guard let node = node else {
            return (-1, -1)
        }
        if node.val == target {
            return (parent?.val ?? 1, depth)
        }
        let left = dfs(depth + 1, node.left, node, target)
        if left.0 != -1 {
            return left
        }
        return dfs(depth + 1, node.right, node, target)
        
    }
    
}



//: [Next](@next)
