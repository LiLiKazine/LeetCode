//: [Previous](@previous)

/*
 
 863. All Nodes Distance K in Binary Tree
 
 Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node.

 You can return the answer in any order.

  

 Example 1:


 Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, k = 2
 Output: [7,4,1]
 Explanation: The nodes that are a distance 2 from the target node (with value 5) have values 7, 4, and 1.
 Example 2:

 Input: root = [1], target = 1, k = 3
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [1, 500].
 0 <= Node.val <= 500
 All the values Node.val are unique.
 target is the value of one of the nodes in the tree.
 0 <= k <= 1000
 
 */
//[3,5,1,6,2,0,8,null,null,7,4]
/*
                    3
                5       1
            6       2 0     8
                7   4
 
 */
extension TreeNode {
    var key: Int {
        let opaque = Unmanaged.passUnretained(self).toOpaque()
        return opaque.hashValue
    }
}

class Solution {
    private var dict: [Int: TreeNode] = [:], rootKey: Int = 0
    
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root = root, let node = target else { return [] }
        rootKey = root.key
        map(root)
        
        let ans = find(node, k)
        return ans
    }
    
    private func trace(_ node: TreeNode?, _ k: Int) -> [Int] {
        guard let node = node, node.key != rootKey else {
            return []
        }
        if k > 0, let parent = dict[node.key] {
            let v1 = trace(parent, k - 1)
            let v2 = find(parent, k - 1)
            return v1 + v2
        } else if k == 0 {
            return [node.val]
        }
        return []
    }
    
    private func find(_ node: TreeNode?, _ k: Int) -> [Int] {
        guard let node = node, node.key != rootKey else {
            return []
        }
        if k > 0 {
            let v1 = find(node.left, k - 1)
            let v2 = find(node.right, k - 1)
            let v3 = trace(dict[node.key], k - 1)
            return v1 + v2 + v3
        } else if k == 0 {
            return [node.val]
        }
        return []
    }
    
    private func map(_ node: TreeNode?) {
        guard let node = node else { return }
        if let left = node.left {
            dict[left.key] = node
            map(left)
        }
        if let right = node.right {
            dict[right.key] = node
            map(right)
        }
    }
}

//: [Next](@next)
