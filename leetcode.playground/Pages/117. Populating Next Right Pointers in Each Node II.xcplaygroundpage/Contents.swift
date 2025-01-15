//: [Previous](@previous)

/*
 
 117. Populating Next Right Pointers in Each Node II
 
 Given a binary tree
 
 struct Node {
 int val;
 Node *left;
 Node *right;
 Node *next;
 }
 Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.
 
 Initially, all next pointers are set to NULL.
 
 
 
 Follow up:
 
 You may only use constant extra space.
 Recursive approach is fine, you may assume implicit stack space does not count as extra space for this problem.
 
 
 Example 1:
 
 
 
 Input: root = [1,2,3,4,5,null,7]
 Output: [1,#,2,3,#,4,5,7,#]
 Explanation: Given the above binary tree (Figure A), your function should populate each next pointer to point to its next right node, just like in Figure B. The serialized output is in level order as connected by the next pointers, with '#' signifying the end of each level.
 
 
 Constraints:
 
 The number of nodes in the given tree is less than 6000.
 -100 <= node.val <= 100
 
 */

/*
 
 1,2,3,4,null,null,5
 
        1
    2       3
 4              5
 
 
 [2,1,3,0,7,9,1,2,null,1,0,null,null,8,8,null,null,null,null,7]
 
                              2
                        1           3
                    0    7       9     1
                2       1  0          8  8
                           7
 
 [2,#,1,3,#,0,7,9,1,#,2,1,0,#,7,#]
 [2,#,1,3,#,0,7,9,1,#,2,1,0,8,8,#,7,#]
 */


public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

class Solution {
    func connect(_ root: Node?) -> Node? {
        
        func dfs(_ node: Node?, _ right: Node?) {
            guard let node else { return }
            node.next = right
            
            var right = right
            while right?.left == nil && right?.right == nil && right?.next != nil {
                right = right?.next
            }
            var next = right?.left ?? right?.right
            if let right = node.right {
                dfs(node.right, next)
                dfs(node.left, right)
            } else {
                dfs(node.left, next)
            }
        }
        dfs(root, nil)
        return root
    }
}

func buildTree(_ vals: [Int?]) -> Node? {
    var vals = vals
    let root = Node(vals.removeFirst()!)
    var cache: [Node] = [root]
    while !cache.isEmpty{
        let last = cache.removeFirst()
        if vals.count > 0, let vl = vals.removeFirst() {
            let node = Node(vl)
            last.left = node
            cache.append(node)
        }
        if vals.count > 0, let vr = vals.removeFirst() {
            let node = Node(vr)
            last.right = node
            cache.append(node)
        }
    }
    return root
}

let vals = [2,1,3,0,7,9,1,2,nil,1,0,nil,nil,8,8,nil,nil,nil,nil,7]

let tree = buildTree(vals)

let solution = Solution()
let ans = solution.connect(tree)
ans

//: [Next](@next)
