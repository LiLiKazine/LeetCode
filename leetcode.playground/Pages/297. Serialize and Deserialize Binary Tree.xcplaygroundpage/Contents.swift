//: [Previous](@previous)

/*
 297. Serialize and Deserialize Binary Tree
 困难
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

 Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

  

 Example 1:


 Input: root = [1,2,3,null,null,4,5]
 Output: [1,2,3,null,null,4,5]
 Example 2:

 Input: root = []
 Output: []
  

 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -1000 <= Node.val <= 1000
 */

import Foundation

class Codec {
    
    func serialize(_ root: TreeNode?) -> String {
        var res = ""
        func dfs(_ node: TreeNode?) {
            if res.count > 0 {
                res += ","
            }
            guard let node else {
                res += "#"
                return
            }
            res += "\(node.val)"
            dfs(node.left)
            dfs(node.right)
        }
        dfs(root)
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var components = data.split(separator: ",")
        
        func buildTree() -> TreeNode? {
            guard components.count > 0 else {
                return nil
            }
            let top = components.removeFirst()
            if top == "#" {
                return nil
            }
            let node = TreeNode(Int(top)!)
            node.left = buildTree()
            node.right = buildTree()
            return node
        }
        return buildTree()
    }
    
    /*
    func serialize(_ root: TreeNode?) -> String {
        var res = ""
        func dfs(_ node: TreeNode?, _ i: Int) {
            guard let node else { return }
            let value = "\(node.val):\(i)"
            if res.count > 0 {
                res += ","
            }
            res += value
            dfs(node.left, i * 2)
            dfs(node.right, i * 2 + 1)
        }
        dfs(root, 1)
        return res
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var dict = [Int: Int]()
        for pair in data.split(separator: ",") {
            let components = pair.split(separator: ":")
            dict[Int(components[1])!] = Int(components[0])!
        }
        func buildTree(_ i: Int) -> TreeNode? {
            guard let val = dict[i] else { return nil }
            let node = TreeNode(val)
            node.left = buildTree(i * 2)
            node.right = buildTree(i * 2 + 1)
            return node
        }
        
        return buildTree(1)
    }
    */
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))

//: [Next](@next)
