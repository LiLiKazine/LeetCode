//: [Previous](@previous)

/*
 323. Number of Connected Components in an Undirected Graph
 中等
 
 You have a graph of n nodes. You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.

 Return the number of connected components in the graph.

  

 Example 1:


 Input: n = 5, edges = [[0,1],[1,2],[3,4]]
 Output: 2
 Example 2:


 Input: n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]
 Output: 1
  

 Constraints:

 1 <= n <= 2000
 1 <= edges.length <= 5000
 edges[i].length == 2
 0 <= ai <= bi < n
 ai != bi
 There are no repeated edges.
 
 */

import Foundation

class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {

        var route = Array(repeating: [Int](), count: n)
        for edge in edges {
            route[edge[0]] = route[edge[0]] + [edge[1]]
            route[edge[1]] = route[edge[1]] + [edge[0]]
        }
        var counter = 0
        var visited = Array(repeating: false, count: n)
        for i in 0..<n {
            if visited[i] {
                continue
            }
            counter += 1
            dfs(route: route, i: i, visited: &visited)
            
        }
        return counter
    }
    
    
    
    func dfs(route: [[Int]], i: Int, visited: inout [Bool]) {
        
        if visited[i] { return }
        
        visited[i] = true
        
        let children = route[i]
        for child in children {
            dfs(route: route, i: child, visited: &visited)
        }
    }
}

//: [Next](@next)
