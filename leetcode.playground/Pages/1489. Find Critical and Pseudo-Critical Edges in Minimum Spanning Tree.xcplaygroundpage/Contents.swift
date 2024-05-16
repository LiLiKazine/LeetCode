//: [Previous](@previous)

/*
 1489. Find Critical and Pseudo-Critical Edges in Minimum Spanning Tree
 困难
 Given a weighted undirected connected graph with n vertices numbered from 0 to n - 1, and an array edges where edges[i] = [ai, bi, weighti] represents a bidirectional and weighted edge between nodes ai and bi. A minimum spanning tree (MST) is a subset of the graph's edges that connects all vertices without cycles and with the minimum possible total edge weight.

 Find all the critical and pseudo-critical edges in the given graph's minimum spanning tree (MST). An MST edge whose deletion from the graph would cause the MST weight to increase is called a critical edge. On the other hand, a pseudo-critical edge is that which can appear in some MSTs but not all.

 Note that you can return the indices of the edges in any order.

  

 Example 1:



 Input: n = 5, edges = [[0,1,1],[1,2,1],[2,3,2],[0,3,2],[0,4,3],[3,4,3],[1,4,6]]
 Output: [[0,1],[2,3,4,5]]
 Explanation: The figure above describes the graph.
 The following figure shows all the possible MSTs:

 Notice that the two edges 0 and 1 appear in all MSTs, therefore they are critical edges, so we return them in the first list of the output.
 The edges 2, 3, 4, and 5 are only part of some MSTs, therefore they are considered pseudo-critical edges. We add them to the second list of the output.
 Example 2:



 Input: n = 4, edges = [[0,1,1],[1,2,1],[2,3,1],[0,3,1]]
 Output: [[],[0,1,2,3]]
 Explanation: We can observe that since all 4 edges have equal weight, choosing any 3 edges from the given 4 will yield an MST. Therefore all 4 edges are pseudo-critical.
  

 Constraints:

 2 <= n <= 100
 1 <= edges.length <= min(200, n * (n - 1) / 2)
 edges[i].length == 3
 0 <= ai < bi < n
 1 <= weighti <= 1000
 All pairs (ai, bi) are distinct.

 */
import Foundation

class Solution {
    
    class Union {
        
        private var arr: [Int]
        private(set) var cnt: Int
        
        init(n: Int) {
            arr = Array(0...n)
            cnt = n
        }
        
        func find(_ n: Int) -> Int {
            if arr[n] == n { return n }
            arr[n] = find(arr[n])
            return arr[n]
        }
        
        func union(_ a: Int, _ b: Int) -> Bool {
            let rootA = find(a), rootB = find(b)
            if rootA == rootB {
                return false
            }
            arr[rootA] = rootB
            cnt -= 1
            return true
        }
    }
    
    func findCriticalAndPseudoCriticalEdges(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        let edges = edges
            .enumerated().map { (i, arr) in
                return arr + [i]
            }
            .sorted { a, b in
                return a[2] <= b[2]
            }
        
        let union = Union(n: n)
        var val = 0
        
        for edge in edges {
            let a = edge[0], b = edge[1], cost = edge[2]
            if union.union(a, b) {
                val += cost
            }
            if union.cnt == 1 {
                break
            }
        }
        var ans: [[Int]] = [[], []]
        for i in 0..<edges.count {
            var union = Union(n: n)
            var cost = 0
            for j in 0..<edges.count {
                if i != j && union.union(edges[j][0], edges[j][1]) {
                    cost += edges[j][2]
                }
            }
            
            if union.cnt != 1 || (union.cnt == 1 && cost > val) {
                ans[0].append(edges[i][3])
                continue
            }
        
            union = Union(n: n)
            union.union(edges[i][0], edges[i][1])
            cost = edges[i][2]
            for j in 0..<edges.count {
                if i != j && union.union(edges[j][0], edges[j][1]) {
                    cost += edges[j][2]
                }
            }
            if union.cnt == 1 && cost == val {
                ans[1].append(edges[i][3])
            }
        }
        return ans
    }
}


//: [Next](@next)
