//: [Previous](@previous)

/*
 
 1261. Find Elements in a Contaminated Binary Tree
 
 Given a binary tree with the following rules:
 
 root.val == 0
 If treeNode.val == x and treeNode.left != null, then treeNode.left.val == 2 * x + 1
 If treeNode.val == x and treeNode.right != null, then treeNode.right.val == 2 * x + 2
 Now the binary tree is contaminated, which means all treeNode.val have been changed to -1.
 
 You need to first recover the binary tree and then implement the FindElements class:
 
 FindElements(TreeNode* root) Initializes the object with a contamined binary tree, you need to recover it first.
 bool find(int target) Return if the target value exists in the recovered binary tree.
 
 
 Example 1:
 
 
 
 Input
 ["FindElements","find","find"]
 [[[-1,null,-1]],[1],[2]]
 Output
 [null,false,true]
 Explanation
 FindElements findElements = new FindElements([-1,null,-1]);
 findElements.find(1); // return False
 findElements.find(2); // return True
 Example 2:
 
 
 
 Input
 ["FindElements","find","find","find"]
 [[[-1,-1,-1,-1,-1]],[1],[3],[5]]
 Output
 [null,true,true,false]
 Explanation
 FindElements findElements = new FindElements([-1,-1,-1,-1,-1]);
 findElements.find(1); // return True
 findElements.find(3); // return True
 findElements.find(5); // return False
 Example 3:
 
 
 
 Input
 ["FindElements","find","find","find","find"]
 [[[-1,null,-1,-1,null,-1]],[2],[3],[4],[5]]
 Output
 [null,true,false,false,true]
 Explanation
 FindElements findElements = new FindElements([-1,null,-1,-1,null,-1]);
 findElements.find(2); // return True
 findElements.find(3); // return False
 findElements.find(4); // return False
 findElements.find(5); // return True
 
 
 Constraints:
 
 TreeNode.val == -1
 The height of the binary tree is less than or equal to 20
 The total number of nodes is between [1, 10^4]
 Total calls of find() is between [1, 10^4]
 0 <= target <= 10^6
 
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


class FindElements {
    
    var root: TreeNode?
    
    init(_ root: TreeNode?) {
        root?.val = 0
        recover(root)
        self.root = root
    }
    
    func find(_ target: Int) -> Bool {
        var target = target, path = [Int]()
        while target > 0 {
            if target % 2 == 0 {
                target = (target - 2) / 2
                path.insert(1, at: 0)
            } else {
                target = (target - 1) / 2
                path.insert(0, at: 0)
            }
        }
        var node = root
        for p in path {
            if p == 0 {
                node = node?.left
            } else {
                node = node?.right
            }
        }
        return node != nil
    }
    
    private func recover(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        node.left?.val = 2 * node.val + 1
        node.right?.val = 2 * node.val + 2
        recover(node.left)
        recover(node.right)
    }
}

/**
 * Your FindElements object will be instantiated and called as such:
 * let obj = FindElements(root)
 * let ret_1: Bool = obj.find(target)
 */

//: [Next](@next)
