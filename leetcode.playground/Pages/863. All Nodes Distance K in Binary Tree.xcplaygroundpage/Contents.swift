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
             6     2  0   8
                  7 4
 
 */


class Solution {
    
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let target else { return [] }
        var route = [Int: [Int]]()
        func dfs(_ node: TreeNode?) {
            guard let node else { return }
            if let left = node.left {
                route[node.val, default: []].append(left.val)
                route[left.val, default: []].append(node.val)
                dfs(left)
            }
            if let right = node.right {
                route[node.val, default: []].append(right.val)
                route[right.val, default: []].append(node.val)
                dfs(right)
            }
        }
        dfs(root)
        var k = k, res = [target.val], visited = Set(res)
        while k > 0 && res.count > 0 {
            var next = [Int]()
            for val in res {
                next += route[val, default: []].filter { visited.insert($0).inserted }
            }
            res = next
            k -= 1
        }
        return res
    }
}

//: [Next](@next)
