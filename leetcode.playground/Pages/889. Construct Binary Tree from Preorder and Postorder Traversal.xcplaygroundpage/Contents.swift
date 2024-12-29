//: [Previous](@previous)

/*
 889. Construct Binary Tree from Preorder and Postorder Traversal
 中等
 Given two integer arrays, preorder and postorder where preorder is the preorder traversal of a binary tree of distinct values and postorder is the postorder traversal of the same tree, reconstruct and return the binary tree.

 If there exist multiple answers, you can return any of them.

  

 Example 1:


 Input: preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]
 Output: [1,2,3,4,5,6,7]
 Example 2:

 Input: preorder = [1], postorder = [1]
 Output: [1]
  

 Constraints:

 1 <= preorder.length <= 30
 1 <= preorder[i] <= preorder.length
 All the values of preorder are unique.
 postorder.length == preorder.length
 1 <= postorder[i] <= postorder.length
 All the values of postorder are unique.
 It is guaranteed that preorder and postorder are the preorder traversal and postorder traversal of the same binary tree.
 */

import Foundation

class Solution {
    func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
        var postMap = [Int: Int]()
        for (i, v) in postorder.enumerated() {
            postMap[v] = i
        }
        
        func dfs(_ preLeft: Int, _ preRight: Int, _ postLeft: Int, _ postRight: Int) -> TreeNode? {
            if preLeft > preRight {
                return nil
            }
            var leftCount: Int = 0
            if preLeft < preRight {
                leftCount = postMap[preorder[preLeft + 1]]! - postLeft + 1
            }
            let root = TreeNode(preorder[preLeft])
            root.left = dfs(preLeft + 1, preLeft + leftCount, postLeft, postLeft + leftCount - 1)
            root.right = dfs(preLeft + leftCount + 1, preRight, postLeft + leftCount, postRight - 1)
            return root
        }
        let n = preorder.count
        return dfs(0, n - 1, 0, n - 1)
    }
}

//: [Next](@next)
