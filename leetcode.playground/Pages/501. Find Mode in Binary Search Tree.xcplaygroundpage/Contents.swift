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
    func findMode(_ root: TreeNode?) -> [Int] {
        var ans = [Int](), maxcnt = 0
        
        var prev: TreeNode? = nil, cnt = 0
        func dfs(_ p: TreeNode?) {
            guard let p else { return }
            
            dfs(p.left)
            
            if let prev, prev.val == p.val {
                cnt += 1
            } else {
                cnt = 0
            }
            if cnt > maxcnt {
                ans.removeAll()
            }
            maxcnt = max(maxcnt, cnt)
            if maxcnt == cnt {
                ans.append(p.val)
            }
            prev = p
            
            dfs(p.right)
            
        }
        dfs(root)
        
        return ans
    }
    
}

//: [Next](@next)
