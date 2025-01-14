//: [Previous](@previous)

/*
 742. Closest Leaf in a Binary Tree
 中等
 Given the root of a binary tree where every node has a unique value and a target integer k, return the value of the nearest leaf node to the target k in the tree.

 Nearest to a leaf means the least number of edges traveled on the binary tree to reach any leaf of the tree. Also, a node is called a leaf if it has no children.

  

 Example 1:


 Input: root = [1,3,2], k = 1
 Output: 2
 Explanation: Either 2 or 3 is the nearest leaf node to the target of 1.
 Example 2:


 Input: root = [1], k = 1
 Output: 1
 Explanation: The nearest leaf node is the root node itself.
 Example 3:


 Input: root = [1,2,3,4,null,null,null,5,null,6], k = 2
 Output: 3
 Explanation: The leaf node with value 3 (and not the leaf node with value 6) is nearest to the node with value 2.
  

 Constraints:

 The number of nodes in the tree is in the range [1, 1000].
 1 <= Node.val <= 1000
 All the values of the tree are unique.
 There exist some node in the tree where Node.val == k.
 */

import Foundation

class Solution {
    func findClosestLeaf(_ root: TreeNode?, _ k: Int) -> Int {
        var leaves = Set<Int>()
        var graph = [Int: [Int]]()
        func map(_ node: TreeNode?) {
            guard let node else { return }
            if let left = node.left {
                graph[node.val, default: []].append(left.val)
                graph[left.val, default: []].append(node.val)
                map(left)
            }
            if let right = node.right {
                graph[node.val, default: []].append(right.val)
                graph[right.val, default: []].append(node.val)
                map(right)
            }
            if node.left == nil && node.right == nil {
                leaves.insert(node.val)
            }
        }
        map(root)
        if leaves.contains(k) {
            return k
        }
        var visited = Set(arrayLiteral: k), next = [k]
        while next.count > 0 {
            var tmp = [Int]()
            for i in next.flatMap({ graph[$0, default: []] }) {
                guard visited.insert(i).inserted else { continue }
                if leaves.contains(i) {
                    return i
                }
                tmp.append(i)
            }
            next = tmp
        }
        return -1
    }
}

//: [Next](@next)
