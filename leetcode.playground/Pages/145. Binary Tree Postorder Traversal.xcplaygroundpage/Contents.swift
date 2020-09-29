//: [Previous](@previous)

/*
 
 145. Binary Tree Postorder Traversal
 
 Given the root of a binary tree, return the postorder traversal of its nodes' values.
 
 
 
 Example 1:
 
 
 Input: root = [1,null,2,3]
 Output: [3,2,1]
 Example 2:
 
 Input: root = []
 Output: []
 Example 3:
 
 Input: root = [1]
 Output: [1]
 Example 4:
 
 
 Input: root = [1,2]
 Output: [2,1]
 Example 5:
 
 
 Input: root = [1,null,2]
 Output: [2,1]
 
 
 Constraints:
 
 The number of the nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 
 
 Follow up:
 
 Recursive solution is trivial, could you do it iteratively?
 
 */

/*
 
 class Solution {
     public List<Integer> postorderTraversal(TreeNode root) {
         List<Integer> res = new ArrayList<Integer>();
         if (root == null) {
             return res;
         }

         Deque<TreeNode> stack = new LinkedList<TreeNode>();
         TreeNode prev = null;
         while (root != null || !stack.isEmpty()) {
             while (root != null) {
                 stack.push(root);
                 root = root.left;
             }
             root = stack.pop();
             if (root.right == null || root.right == prev) {
                 res.add(root.val);
                 prev = root;
                 root = null;
             } else {
                 stack.push(root);
                 root = root.right;
             }
         }
         return res;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/binary-tree-postorder-traversal/solution/er-cha-shu-de-hou-xu-bian-li-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

/*
 
 class Solution {
     public List<Integer> postorderTraversal(TreeNode root) {
         List<Integer> res = new ArrayList<Integer>();
         if (root == null) {
             return res;
         }

         TreeNode p1 = root, p2 = null;

         while (p1 != null) {
             p2 = p1.left;
             if (p2 != null) {
                 while (p2.right != null && p2.right != p1) {
                     p2 = p2.right;
                 }
                 if (p2.right == null) {
                     p2.right = p1;
                     p1 = p1.left;
                     continue;
                 } else {
                     p2.right = null;
                     addPath(res, p1.left);
                 }
             }
             p1 = p1.right;
         }
         addPath(res, root);
         return res;
     }

     public void addPath(List<Integer> res, TreeNode node) {
         List<Integer> tmp = new ArrayList<Integer>();
         while (node != null) {
             tmp.add(node.val);
             node = node.right;
         }
         for (int i = tmp.size() - 1; i >= 0; --i) {
             res.add(tmp.get(i));
         }
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/binary-tree-postorder-traversal/solution/er-cha-shu-de-hou-xu-bian-li-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        
        return iterate(root)
    }
    
    func iterate(_ node: TreeNode?) -> [Int] {
        var node = node,
            prev: TreeNode?
        var ans = [Int]()
        var cache = [TreeNode]()
        
        
        while node != nil || !cache.isEmpty {
            while node != nil {
                cache.append(node!)
                node = node?.left
            }
            node = cache.popLast()
            if node?.right == nil || node?.right?.val == prev?.val {
                ans.append(node!.val)
                prev = node
                node = nil
            } else {
                cache.append(node!)
                node = node?.right
            }
            /*
             8
            /
           4
            \
             3
             */
        }
 
        return ans
    }
    
    func recursive(_ node: TreeNode?) -> [Int] {
        var ans = [Int]()
        guard let node = node else {
            return ans
        }
        ans = recursive(node.left) + recursive(node.right) + [node.val]
        return ans
    }
}

//: [Next](@next)
