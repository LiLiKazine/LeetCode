//: [Previous](@previous)

/*
 2096. Step-By-Step Directions From a Binary Tree Node to Another
 中等
 You are given the root of a binary tree with n nodes. Each node is uniquely assigned a value from 1 to n. You are also given an integer startValue representing the value of the start node s, and a different integer destValue representing the value of the destination node t.

 Find the shortest path starting from node s and ending at node t. Generate step-by-step directions of such path as a string consisting of only the uppercase letters 'L', 'R', and 'U'. Each letter indicates a specific direction:

 'L' means to go from a node to its left child node.
 'R' means to go from a node to its right child node.
 'U' means to go from a node to its parent node.
 Return the step-by-step directions of the shortest path from node s to node t.

  

 Example 1:


 Input: root = [5,1,2,3,null,6,4], startValue = 3, destValue = 6
 Output: "UURL"
 Explanation: The shortest path is: 3 → 1 → 5 → 2 → 6.
 Example 2:


 Input: root = [2,1], startValue = 2, destValue = 1
 Output: "L"
 Explanation: The shortest path is: 2 → 1.
  

 Constraints:

 The number of nodes in the tree is n.
 2 <= n <= 105
 1 <= Node.val <= n
 All the values in the tree are unique.
 1 <= startValue, destValue <= n
 startValue != destValue
 */

import Foundation

class Solution {
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        
        var route = "", ans1 = "", ans2 = ""
        
        func dfs(_ p: TreeNode?, _ startValue: Int, _ destValue: Int) {
            guard let p else { return }
            
            if p.val == startValue {
                ans1 = route
            }
            if p.val == destValue {
                ans2 = route
            }
            route += "L"
            dfs(p.left, startValue, destValue)
            route.removeLast()
            route += "R"
            dfs(p.right, startValue, destValue)
            route.removeLast()
        }
        dfs(root, startValue, destValue)
        while ans1.count > 0 && ans2.count > 0 && ans1.first! == ans2.first! {
            ans1.removeFirst()
            ans2.removeFirst()
        }
        return String(repeating: Character("U"), count: ans1.count) + ans2
    }
}

//: [Next](@next)
