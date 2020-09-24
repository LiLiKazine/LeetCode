//: [Previous](@previous)

/*
 
 501. Find Mode in Binary Search Tree
 
 Given a binary search tree (BST) with duplicates, find all the mode(s) (the most frequently occurred element) in the given BST.
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than or equal to the node's key.
 The right subtree of a node contains only nodes with keys greater than or equal to the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 
 For example:
 Given BST [1,null,2,2],
 
 1
 \
 2
 /
 2
 
 
 return [2].
 
 Note: If a tree has more than one mode, you can return them in any order.
 
 Follow up: Could you do that without using any extra space? (Assume that the implicit stack space incurred due to recursion does not count).
 
 */

/*
 
 class Solution {
 public:
     int base, count, maxCount;
     vector<int> answer;

     void update(int x) {
         if (x == base) {
             ++count;
         } else {
             count = 1;
             base = x;
         }
         if (count == maxCount) {
             answer.push_back(base);
         }
         if (count > maxCount) {
             maxCount = count;
             answer = vector<int> {base};
         }
     }

     vector<int> findMode(TreeNode* root) {
         TreeNode *cur = root, *pre = nullptr;
         while (cur) {
             if (!cur->left) {
                 update(cur->val);
                 cur = cur->right;
                 continue;
             }
             pre = cur->left;
             while (pre->right && pre->right != cur) {
                 pre = pre->right;
             }
             if (!pre->right) {
                 pre->right = cur;
                 cur = cur->left;
             } else {
                 pre->right = nullptr;
                 update(cur->val);
                 cur = cur->right;
             }
         }
         return answer;
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/find-mode-in-binary-search-tree/solution/er-cha-sou-suo-shu-zhong-de-zhong-shu-by-leetcode-/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
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
    var cache = [Int: Int]()
    var ans = [Int]()
    func findMode(_ root: TreeNode?) -> [Int] {
        sumup(root)
        return ans
    }
    
    func sumup(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        
        let count = (cache[node.val] ?? 0) + 1
        if ans.isEmpty {
            ans.append(node.val)
        } else {
            if count > cache[ans.first!]! {
                ans = [node.val]
            } else if count == cache[ans[0]]! && !ans.contains(node.val) {
                ans.append(node.val)
            }
        }
        cache[node.val] = count
        sumup(node.left)
        sumup(node.right)
    }
}

//: [Next](@next)
