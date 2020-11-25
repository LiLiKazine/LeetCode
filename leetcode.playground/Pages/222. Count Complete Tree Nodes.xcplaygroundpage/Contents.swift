//: [Previous](@previous)

/*
 
 222. Count Complete Tree Nodes
 
 Given a complete binary tree, count the number of nodes.

 Note:

 Definition of a complete binary tree from Wikipedia:
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.

 Example:

 Input:
     1
    / \
   2   3
  / \  /
 4  5 6

 Output: 6
 
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

/*
 
 class Solution {
     public int countNodes(TreeNode root) {
         if (root == null) {
             return 0;
         }
         int level = 0;
         TreeNode node = root;
         while (node.left != null) {
             level++;
             node = node.left;
         }
         int low = 1 << level, high = (1 << (level + 1)) - 1;
         while (low < high) {
             int mid = (high - low + 1) / 2 + low;
             if (exists(root, level, mid)) {
                 low = mid;
             } else {
                 high = mid - 1;
             }
         }
         return low;
     }

     public boolean exists(TreeNode root, int level, int k) {
         int bits = 1 << (level - 1);
         TreeNode node = root;
         while (node != null && bits > 0) {
             if ((bits & k) == 0) {
                 node = node.left;
             } else {
                 node = node.right;
             }
             bits >>= 1;
         }
         return node != null;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/count-complete-tree-nodes/solution/wan-quan-er-cha-shu-de-jie-dian-ge-shu-by-leetco-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

import Foundation

class Solution {
    func countNodes(_ root: TreeNode?) -> Int {
        guard root != nil else {
            return 0
        }
        var depth = 0, node = root
        while node?.left != nil {
            depth += 1
            node = node?.left
        }
        var least = 1 << depth, most = (1 << (depth + 1)) - 1
        while least < most {
            let mid = (most - least + 1) / 2 + least
            if exist(root, depth, mid) {
                least = mid
            } else {
                most = mid - 1
            }
            print(least, mid, most)
        }
        return least
    }
    
    func exist(_ root: TreeNode?, _ lev: Int, _ k: Int) -> Bool {
        var bits = 1 << (lev - 1), node = root
        while node != nil && bits > 0 {
            if (bits & k) == 0 {
                node = node?.left
            } else {
                node = node?.right
            }
            bits >>= 1
            
        }
        return node != nil
        
    }
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)

let solution = Solution()
let ans = solution.countNodes(root)
ans

//: [Next](@next)
