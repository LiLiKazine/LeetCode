//: [Previous](@previous)

/*
 261. Graph Valid Tree
 中等
 You have a graph of n nodes labeled from 0 to n - 1. You are given an integer n and a list of edges where edges[i] = [ai, bi] indicates that there is an undirected edge between nodes ai and bi in the graph.

 Return true if the edges of the given graph make up a valid tree, and false otherwise.

  

 Example 1:


 Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
 Output: true
 Example 2:


 Input: n = 5, edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
 Output: false
  

 Constraints:

 1 <= n <= 2000
 0 <= edges.length <= 5000
 edges[i].length == 2
 0 <= ai, bi < n
 ai != bi
 There are no self-loops or repeated edges.
 
 */

import Foundation

class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var adjacent = [Int: [Int]]()
        
        func put(_ a: Int, _ b: Int) {
            let nexts = adjacent[a] ?? []
            adjacent[a] = nexts + [b]
        }
        
        for edge in edges {
            put(edge[0], edge[1])
            put(edge[1], edge[0])
        }
        
        var visited = Set<Int>()
        
        func dfs(_ node: Int, _ parent: Int) -> Bool {
            if visited.contains(node) {
                return false
            }
            visited.insert(node)
            let nexts = adjacent[node] ?? []
            for next in nexts {
                if next == parent { continue }
                guard dfs(next, node) else {
                    return false
                }
            }
            return true
        }
        
        return dfs(0, -1) && visited.count == n
        
    }
}

//: [Next](@next)
