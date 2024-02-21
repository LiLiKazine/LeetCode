//: [Previous](@previous)

/*
 1059. All Paths from Source Lead to Destination
 中等
 
 Given the edges of a directed graph where edges[i] = [ai, bi] indicates there is an edge between nodes ai and bi, and two nodes source and destination of this graph, determine whether or not all paths starting from source eventually, end at destination, that is:

 At least one path exists from the source node to the destination node
 If a path exists from the source node to a node with no outgoing edges, then that node is equal to destination.
 The number of possible paths from source to destination is a finite number.
 Return true if and only if all roads from source lead to destination.

  

 Example 1:


 Input: n = 3, edges = [[0,1],[0,2]], source = 0, destination = 2
 Output: false
 Explanation: It is possible to reach and get stuck on both node 1 and node 2.
 Example 2:


 Input: n = 4, edges = [[0,1],[0,3],[1,2],[2,1]], source = 0, destination = 3
 Output: false
 Explanation: We have two possibilities: to end at node 3, or to loop over node 1 and node 2 indefinitely.
 Example 3:


 Input: n = 4, edges = [[0,1],[0,2],[1,3],[2,3]], source = 0, destination = 3
 Output: true
  

 Constraints:

 1 <= n <= 104
 0 <= edges.length <= 104
 edges.length == 2
 0 <= ai, bi <= n - 1
 0 <= source <= n - 1
 0 <= destination <= n - 1
 The given graph may have self-loops and parallel edges.
 */

import Foundation

class Solution {
    var visited = [Int]()
    var route = [Int: [Int]]()
    func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        visited = Array(repeating: 0, count: n)
        for edge in edges {
            let children = route[edge[0]] ?? []
            route[edge[0]] = children + [edge[1]]
        }
        return find(from: source, destination)
    }
    
    func find(from source: Int, _ destination: Int) -> Bool {
        let children = route[source] ?? []
        if source == destination && children.isEmpty { return true }
        let vis = visited[source]
        if vis == -1 { return false }
        if vis == 1 { return true }
        visited[source] = -1
        if children.isEmpty { return false }
        for child in children {
            guard find(from: child, destination) else {
                visited[child] = -1
                visited[source] = -1
                return false
            }
            visited[child] = 1
        }
        visited[source] = 1
        return true
    }
}

//: [Next](@next)
