//: [Previous](@previous)

/*
 988. Smallest String Starting From Leaf
 中等
 You are given the root of a binary tree where each node has a value in the range [0, 25] representing the letters 'a' to 'z'.

 Return the lexicographically smallest string that starts at a leaf of this tree and ends at the root.

 As a reminder, any shorter prefix of a string is lexicographically smaller.

 For example, "ab" is lexicographically smaller than "aba".
 A leaf of a node is a node that has no children.

  

 Example 1:


 Input: root = [0,1,2,3,4,3,4]
 Output: "dba"
 Example 2:


 Input: root = [25,1,3,1,3,0,2]
 Output: "adz"
 Example 3:


 Input: root = [2,2,1,null,1,0,null,0]
 Output: "abc"
  

 Constraints:

 The number of nodes in the tree is in the range [1, 8500].
 0 <= Node.val <= 25
 */

import Foundation


class Solution {
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        var ans: String = ""
        
        func str(_ i: Int) -> String {
            let offset = UInt8(i)
            let ascii = Character("a").asciiValue ?? 0
            
            return String(Character(UnicodeScalar(offset + ascii)))
        }

        func dfs(_ node: TreeNode?, _ s: String) {
            guard let node else { return }
            
            let s = str(node.val) + s
            if node.left == nil && node.right == nil {
                if ans.isEmpty {
                    ans = s
                } else {
                    ans = min(ans, s)
                }
                return
            }
            dfs(node.left, s)
            dfs(node.right, s)
        }
        dfs(root, "")
        return ans
    }
}

//: [Next](@next)
