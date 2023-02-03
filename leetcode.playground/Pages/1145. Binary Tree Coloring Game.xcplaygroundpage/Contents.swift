//: [Previous](@previous)

/*
 
 1145. Binary Tree Coloring Game
 
 Two players play a turn based game on a binary tree. We are given the root of this binary tree, and the number of nodes n in the tree. n is odd, and each node has a distinct value from 1 to n.

 Initially, the first player names a value x with 1 <= x <= n, and the second player names a value y with 1 <= y <= n and y != x. The first player colors the node with value x red, and the second player colors the node with value y blue.

 Then, the players take turns starting with the first player. In each turn, that player chooses a node of their color (red if player 1, blue if player 2) and colors an uncolored neighbor of the chosen node (either the left child, right child, or parent of the chosen node.)

 If (and only if) a player cannot choose such a node in this way, they must pass their turn. If both players pass their turn, the game ends, and the winner is the player that colored more nodes.

 You are the second player. If it is possible to choose such a y to ensure you win the game, return true. If it is not possible, return false.

  

 Example 1:


 Input: root = [1,2,3,4,5,6,7,8,9,10,11], n = 11, x = 3
 Output: true
 Explanation: The second player can choose the node with value 2.
 Example 2:

 Input: root = [1,2,3], n = 3, x = 1
 Output: false
  

 Constraints:

 The number of nodes in the tree is n.
 1 <= x <= n <= 100
 n is odd.
 1 <= Node.val <= n
 All the values of the tree are unique.
 
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func btreeGameWinningMove(_ root: TreeNode?, _ n: Int, _ x: Int) -> Bool {
        
        guard let root = root else { return false }
        
        guard let (_, target) = find(x: x, in: root) else {
            return false
        }
        
        let leftNum = subTreeNodes(target.left), rightNum = subTreeNodes(target.right)
        let parentNum = max(0, n - leftNum - rightNum - 1)
        
        if leftNum > rightNum + parentNum + 1 {
            return true
        }
        if rightNum > leftNum + parentNum + 1 {
            return true
        }
        if parentNum > leftNum + rightNum + 1 {
            return true
        }
        
        return false
    }
    
    func find(x: Int, in tree: TreeNode) -> (parent: TreeNode?, target: TreeNode)? {
        if tree.val == x {
            return (nil, tree)
        }
        var finalResult: (parent: TreeNode?, target: TreeNode)?
        if let left = tree.left {
            if left.val == x {
                return (tree, left)
            } else if let result = find(x: x, in: left) {
                finalResult = result
            }
        }
        
        if let right = tree.right {
            if right.val == x {
                return (tree, right)
            } else if let result = find(x: x, in: right) {
                finalResult = result
            }
        }
        return finalResult
    }
    
    func subTreeNodes(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var sum = 1
        if let left = root.left {
            sum += subTreeNodes(left)
        }
        if let right = root.right {
            sum += subTreeNodes(right)
        }
        return sum
    }
        
}

//: [Next](@next)
