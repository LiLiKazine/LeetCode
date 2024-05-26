//: [Previous](@previous)

/*
 1766. Tree of Coprimes
 困难
 There is a tree (i.e., a connected, undirected graph that has no cycles) consisting of n nodes numbered from 0 to n - 1 and exactly n - 1 edges. Each node has a value associated with it, and the root of the tree is node 0.

 To represent this tree, you are given an integer array nums and a 2D array edges. Each nums[i] represents the ith node's value, and each edges[j] = [uj, vj] represents an edge between nodes uj and vj in the tree.

 Two values x and y are coprime if gcd(x, y) == 1 where gcd(x, y) is the greatest common divisor of x and y.

 An ancestor of a node i is any other node on the shortest path from node i to the root. A node is not considered an ancestor of itself.

 Return an array ans of size n, where ans[i] is the closest ancestor to node i such that nums[i] and nums[ans[i]] are coprime, or -1 if there is no such ancestor.

  

 Example 1:



 Input: nums = [2,3,3,2], edges = [[0,1],[1,2],[1,3]]
 Output: [-1,0,0,1]
 Explanation: In the above figure, each node's value is in parentheses.
 - Node 0 has no coprime ancestors.
 - Node 1 has only one ancestor, node 0. Their values are coprime (gcd(2,3) == 1).
 - Node 2 has two ancestors, nodes 1 and 0. Node 1's value is not coprime (gcd(3,3) == 3), but node 0's
   value is (gcd(2,3) == 1), so node 0 is the closest valid ancestor.
 - Node 3 has two ancestors, nodes 1 and 0. It is coprime with node 1 (gcd(3,2) == 1), so node 1 is its
   closest valid ancestor.
 Example 2:



 Input: nums = [5,6,10,2,3,6,15], edges = [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6]]
 Output: [-1,0,-1,0,0,0,-1]
  

 Constraints:

 nums.length == n
 1 <= nums[i] <= 50
 1 <= n <= 105
 edges.length == n - 1
 edges[j].length == 2
 0 <= uj, vj < n
 uj != vj
 
 */

import Foundation

class Solution {
    func getCoprimes(_ nums: [Int], _ edges: [[Int]]) -> [Int] {
        
        var coprime = Array(repeating: Array(repeating: 0, count: 51), count: 51)
        
        for i in 1...50 {
            for j in 1...50 {
                coprime[i][j] = gcd(i, j)
            }
        }

        let n = nums.count
        
        var ans = Array(repeating: -1, count: n)
        
        var tree = [Int: [Int]]()
        func addEdge(from a: Int, to b: Int) {
            if tree[a] == nil {
                tree[a] = [b]
            } else {
                tree[a]?.append(b)
            }
        }
        for edge in edges {
            let a = edge[0], b = edge[1]
            addEdge(from: a, to: b)
            addEdge(from: b, to: a)
        }
        var nodes = [0]
        var union = Array(0..<n)
        var visited = Set(arrayLiteral: 0)
        while nodes.count > 0 {
            var temp = [Int]()
            for node in nodes {
                guard let nexts = tree[node] else {
                    continue
                }
                for next in nexts {
                    if visited.contains(next) { continue }
                    visited.insert(next)
                    union[next] = node
                    temp.append(next)
                }
            }
            nodes = temp
        }

    loop: for i in 0..<n {
            if i == union[i] { continue }
            var cur = union[i]
            
            while coprime[nums[i]][nums[cur]] != 1 {
                if cur == union[cur] {
                    continue loop
                } else {
                    cur = union[cur]
                }
            }
            ans[i] = cur
        }
        
        return ans
    }
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b);
    }
}

//: [Next](@next)
