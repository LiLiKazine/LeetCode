//: [Previous](@previous)

/*
 
 1129. Shortest Path with Alternating Colors
 You are given an integer n, the number of nodes in a directed graph where the nodes are labeled from 0 to n - 1. Each edge is red or blue in this graph, and there could be self-edges and parallel edges.

 You are given two arrays redEdges and blueEdges where:

 redEdges[i] = [ai, bi] indicates that there is a directed red edge from node ai to node bi in the graph, and
 blueEdges[j] = [uj, vj] indicates that there is a directed blue edge from node uj to node vj in the graph.
 Return an array answer of length n, where each answer[x] is the length of the shortest path from node 0 to node x such that the edge colors alternate along the path, or -1 if such a path does not exist.

  

 Example 1:

 Input: n = 3, redEdges = [[0,1],[1,2]], blueEdges = []
 Output: [0,1,-1]
 Example 2:

 Input: n = 3, redEdges = [[0,1]], blueEdges = [[2,1]]
 Output: [0,1,-1]
  

 Constraints:

 1 <= n <= 100
 0 <= redEdges.length, blueEdges.length <= 400
 redEdges[i].length == blueEdges[j].length == 2
 0 <= ai, bi, uj, vj < n
 
 */

class Solution {
    
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var g: [[[Int]]] = Array(0..<2).map { _ in
            return Array(0..<n).map { _ in
                return [Int]()
            }
        }
        var dist = Array(0..<2).map { _ in
            return Array(repeating: Int.max, count: n)
        }
        dist[0][0] = 0
        dist[1][0] = 0
        
        for redEdge in redEdges {
            let source = redEdge[0], dest = redEdge[1]
            g[0][source].append(dest)
        }
        
        for blueEdge in blueEdges {
            let source = blueEdge[0], dest = blueEdge[1]
            g[1][source].append(dest)
        }
        
        var q = [(0, 0), (0, 1)]
        while !q.isEmpty {
            let pair = q.removeFirst()
            let current = pair.0, color = pair.1
            for next in g[1 - color][current] {
                if dist[1-color][next] != Int.max {
                    continue
                }
                dist[1-color][next] = dist[color][current] + 1
                q.append((next, 1-color))
            }
        }
        var ans: [Int] = Array(repeating: -1, count: n)
        for i in 0..<dist[0].count {
            ans[i] = min(dist[0][i], dist[1][i])
            if ans[i] == Int.max {
                ans[i] = -1
            }
        }
        return ans
    }
    
}

//class Solution {
//
//    struct Dot {
//
//        let num: Int
//        var redPath: Set<Int>
//        var bluePath: Set<Int>
//
//    }
//
//    enum Color {
//        case none, red, blue
//    }
//
//    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
//
//        var dots = Array(0..<n).map { Dot(num: $0, redPath: .init(), bluePath: .init()) }
//
//        for redEdge in redEdges {
//            let dot1 = redEdge[0], dot2 = redEdge[1]
//            dots[dot1].redPath.insert(dot2)
//        }
//        for blueEdge in blueEdges {
//            let dot1 = blueEdge[0], dot2 = blueEdge[1]
//            dots[dot1].bluePath.insert(dot2)
//        }
//
//        return Array(0..<n).map { findShortestPath(currentLength: 0, from: 0, to: $0, dots: dots, color: .none) }
//    }
//
//    func findShortestPath(currentLength: Int, from f: Int, to t: Int, dots: [Dot], color: Color) -> Int {
//
//        if f == t { return currentLength }
//
//        var ans = -1
//        if color == .none || color == .red {
//            for dot in dots[f].redPath {
//                var newDots = dots
//                newDots[f].redPath.remove(dot)
//                let tmpAns = findShortestPath(currentLength: currentLength + 1, from: dot, to: t, dots: newDots, color: .blue)
//                if tmpAns == -1 {
//                    continue
//                } else if ans == -1 {
//                    ans = tmpAns
//                } else {
//                    ans = min(ans, tmpAns)
//                }
//            }
//        }
//        if color == .none || color == .blue {
//            for dot in dots[f].bluePath {
//                var newDots = dots
//                newDots[f].bluePath.remove(dot)
//                let tmpAns = findShortestPath(currentLength: currentLength + 1, from: dot, to: t, dots: newDots, color: .red)
//                if tmpAns == -1 {
//                    continue
//                } else if ans == -1 {
//                    ans = tmpAns
//                } else {
//                    ans = min(ans, tmpAns)
//                }
//            }
//        }
//
//        return ans
//    }
//
//}

//let n = 3
//let redEdges = [[0,1],[1,2]]
//let blueEdges: [[Int]] = []
//let n = 3
//let redEdges = [[0,1]]
//let blueEdges = [[2,1]]

let n = 3
let redEdges = [[0,1]]
let blueEdges = [[1,2]]

let solution = Solution()
let ans = solution.shortestAlternatingPaths(n, redEdges, blueEdges)
print(ans)

//: [Next](@next)
