//: [Previous](@previous)

/*
 1857. Largest Color Value in a Directed Graph
 困难
 There is a directed graph of n colored nodes and m edges. The nodes are numbered from 0 to n - 1.

 You are given a string colors where colors[i] is a lowercase English letter representing the color of the ith node in this graph (0-indexed). You are also given a 2D array edges where edges[j] = [aj, bj] indicates that there is a directed edge from node aj to node bj.

 A valid path in the graph is a sequence of nodes x1 -> x2 -> x3 -> ... -> xk such that there is a directed edge from xi to xi+1 for every 1 <= i < k. The color value of the path is the number of nodes that are colored the most frequently occurring color along that path.

 Return the largest color value of any valid path in the given graph, or -1 if the graph contains a cycle.

  

 Example 1:



 Input: colors = "abaca", edges = [[0,1],[0,2],[2,3],[3,4]]
 Output: 3
 Explanation: The path 0 -> 2 -> 3 -> 4 contains 3 nodes that are colored "a" (red in the above image).
 Example 2:



 Input: colors = "a", edges = [[0,0]]
 Output: -1
 Explanation: There is a cycle from 0 to 0.
  

 Constraints:

 n == colors.length
 m == edges.length
 1 <= n <= 105
 0 <= m <= 105
 colors consists of lowercase English letters.
 0 <= aj, bj < n
 
 */

import Foundation

class Solution {
    func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
        let colors = Array(colors)
        let n = colors.count
        var g = Array(repeating: [Int](), count: n)
        var indegrees = Array(repeating: 0, count: n)
        for edge in edges {
            indegrees[edge[1]] += 1
            g[edge[0]].append(edge[1])
        }
        var q = [Int]()
        for i in 0..<n {
            if indegrees[i] == 0 {
                q.append(i)
            }
        }
        var found = 0
        var f = Array(repeating: Array(repeating: 0, count: 26), count: n)
        while q.count > 0 {
            found += 1
            let u = q.removeFirst()
            let scalars = colors[u].unicodeScalars
            let offset = scalars[scalars.startIndex].value - 97
            f[u][Int(offset)] += 1
            for v in g[u] {
                indegrees[v] -= 1
                for c in 0..<26 {
                    f[v][c] = max(f[v][c], f[u][c])
                }
                if indegrees[v] == 0 {
                    q.append(v)
                }
            }
        }
        if found != n {
            return -1;
        }
        
        var ans = 0;
        for i in 0..<n {
            ans = max(ans, f[i].max() ?? 0);
        }
        return ans;
    }
}
//: [Next](@next)
