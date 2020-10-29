//: [Previous](@previous)

/*
 
 129. Sum Root to Leaf Numbers
 
 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
 
 An example is the root-to-leaf path 1->2->3 which represents the number 123.
 
 Find the total sum of all root-to-leaf numbers.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Input: [1,2,3]
 1
 / \
 2   3
 Output: 25
 Explanation:
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 Therefore, sum = 12 + 13 = 25.
 Example 2:
 
 Input: [4,9,0,5,1]
 4
 / \
 9   0
 / \
 5   1
 Output: 1026
 Explanation:
 The root-to-leaf path 4->9->5 represents the number 495.
 The root-to-leaf path 4->9->1 represents the number 491.
 The root-to-leaf path 4->0 represents the number 40.
 Therefore, sum = 495 + 491 + 40 = 1026.
 
 */

/*
 
 class Solution {
     public int sumNumbers(TreeNode root) {
         if (root == null) {
             return 0;
         }
         int sum = 0;
         Queue<TreeNode> nodeQueue = new LinkedList<TreeNode>();
         Queue<Integer> numQueue = new LinkedList<Integer>();
         nodeQueue.offer(root);
         numQueue.offer(root.val);
         while (!nodeQueue.isEmpty()) {
             TreeNode node = nodeQueue.poll();
             int num = numQueue.poll();
             TreeNode left = node.left, right = node.right;
             if (left == null && right == null) {
                 sum += num;
             } else {
                 if (left != null) {
                     nodeQueue.offer(left);
                     numQueue.offer(num * 10 + left.val);
                 }
                 if (right != null) {
                     nodeQueue.offer(right);
                     numQueue.offer(num * 10 + right.val);
                 }
             }
         }
         return sum;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/sum-root-to-leaf-numbers/solution/qiu-gen-dao-xie-zi-jie-dian-shu-zi-zhi-he-by-leetc/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

/*  4
   9   0
nil 1
 
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
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let node = root else {
            return 0
        }
        let ans = sum("0", node: node)
        return ans;
    }
    
    func sum(_ num: String, node: TreeNode) -> Int {
        let newNum = num + String(node.val)
        var ans = 0
        if node.left == nil && node.right == nil {
            ans = Int(newNum)!
            return ans
        }
        if let leftNode = node.left {
            ans += sum(newNum, node: leftNode)
        }
        if let rightNode = node.right {
            ans += sum(newNum, node: rightNode)
        }
        return ans
    }
}

//: [Next](@next)
