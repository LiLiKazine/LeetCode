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
        guard let root, let target else {
            return []
        }
        var parentMap = [Int: TreeNode]()
        func record( _ node: TreeNode, parent: TreeNode?) {
            if let parent {
                parentMap[node.val] = parent
            }
            if let left = node.left {
                record(left, parent: node)
            }
            if let right = node.right {
                record(right, parent: node)
            }
        }
        record(root, parent: nil)
        var ans = [Int]()
        
        func find(from node: TreeNode, _ previous: TreeNode?,  _ k: Int) {
            if k == 0 {
                ans.append(node.val)
                return
            }
            if let parent = parentMap[node.val], parent.val != previous?.val {
                find(from: parent, node, k - 1)
            }
            if let left = node.left, left.val != previous?.val {
                find(from: left, node, k - 1)
            }
            if let right = node.right, right.val != previous?.val {
                find(from: right, node, k - 1)
            }
        }
        
        find(from: target, nil, k)
        
        return ans
    }
   
}

//: [Next](@next)
