//: [Previous](@previous)

/*
 919. Complete Binary Tree Inserter
 中等
 A complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible.

 Design an algorithm to insert a new node to a complete binary tree keeping it complete after the insertion.

 Implement the CBTInserter class:

 CBTInserter(TreeNode root) Initializes the data structure with the root of the complete binary tree.
 int insert(int v) Inserts a TreeNode into the tree with value Node.val == val so that the tree remains complete, and returns the value of the parent of the inserted TreeNode.
 TreeNode get_root() Returns the root node of the tree.
  

 Example 1:


 Input
 ["CBTInserter", "insert", "insert", "get_root"]
 [[[1, 2]], [3], [4], []]
 Output
 [null, 1, 2, [1, 2, 3, 4]]

 Explanation
 CBTInserter cBTInserter = new CBTInserter([1, 2]);
 cBTInserter.insert(3);  // return 1
 cBTInserter.insert(4);  // return 2
 cBTInserter.get_root(); // return [1, 2, 3, 4]
  

 Constraints:

 The number of nodes in the tree will be in the range [1, 1000].
 0 <= Node.val <= 5000
 root is a complete binary tree.
 0 <= val <= 5000
 At most 104 calls will be made to insert and get_root.
 */

import Foundation

class CBTInserter {
    var queue: [TreeNode]
    var idx: Int = 0

    init(_ root: TreeNode?) {
        var queue = root.map { [$0] } ?? []
        var idx = 0
        while idx < queue.count {
            let size = queue.count, start = idx
            for i in start..<size {
                if let left = queue[i].left {
                    queue.append(left)
                }
                if let right = queue[i].right {
                    queue.append(right)
                }
            }
            idx = size
        }
        self.queue = queue
    }
    
    func insert(_ val: Int) -> Int {
        if queue.isEmpty {
            queue = [TreeNode(val)]
            return -1
        }
        while queue[idx].left != nil && queue[idx].right != nil {
             idx += 1
        }
        let node = TreeNode(val)
        if queue[idx].left == nil {
            queue[idx].left = node
        } else {
            queue[idx].right = node
        }
        queue.append(node)
        return queue[idx].val
    }
    
    func get_root() -> TreeNode? {
        return queue.first
    }
}

/**
 * Your CBTInserter object will be instantiated and called as such:
 * let obj = CBTInserter(root)
 * let ret_1: Int = obj.insert(val)
 * let ret_2: TreeNode? = obj.get_root()
 */

//: [Next](@next)
