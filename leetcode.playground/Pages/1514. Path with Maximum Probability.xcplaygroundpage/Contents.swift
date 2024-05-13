//: [Previous](@previous)

/*
 1514. Path with Maximum Probability
 中等
 You are given an undirected weighted graph of n nodes (0-indexed), represented by an edge list where edges[i] = [a, b] is an undirected edge connecting the nodes a and b with a probability of success of traversing that edge succProb[i].

 Given two nodes start and end, find the path with the maximum probability of success to go from start to end and return its success probability.

 If there is no path from start to end, return 0. Your answer will be accepted if it differs from the correct answer by at most 1e-5.

  

 Example 1:



 Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.2], start = 0, end = 2
 Output: 0.25000
 Explanation: There are two paths from start to end, one having a probability of success = 0.2 and the other has 0.5 * 0.5 = 0.25.
 Example 2:



 Input: n = 3, edges = [[0,1],[1,2],[0,2]], succProb = [0.5,0.5,0.3], start = 0, end = 2
 Output: 0.30000
 Example 3:



 Input: n = 3, edges = [[0,1]], succProb = [0.5], start = 0, end = 2
 Output: 0.00000
 Explanation: There is no path between 0 and 2.
  

 Constraints:

 2 <= n <= 10^4
 0 <= start, end < n
 start != end
 0 <= a, b < n
 a != b
 0 <= succProb.length == edges.length <= 2*10^4
 0 <= succProb[i] <= 1
 There is at most one edge between every two nodes.
 
 */

import Foundation

class Solution {
    func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start_node: Int, _ end_node: Int) -> Double {

        var probs: [Double] = Array(repeating: 0, count: n)
        var routes: [Int: [Int: Double]] = [:]
        probs[start_node] = 1
        func addRoute(from a: Int, to b: Int, prob: Double) {
            if routes[a] == nil {
                routes[a] = [b: prob]
            } else {
                routes[a]?[b] = prob
            }
        }
        for (i, edge) in edges.enumerated() {
            let a = edge[0], b = edge[1], prob = succProb[i]
            addRoute(from: a, to: b, prob: prob)
            addRoute(from: b, to: a, prob: prob)
        }
        var queue = [start_node]
        while queue.count > 0 {
            let top = queue.removeFirst()
            guard let currentList = routes[top] else {
                continue
            }
            for (key, value) in currentList {
                let prob = value * probs[top]
                guard prob > probs[key] else {
                    continue
                }
                probs[key] = prob
                queue.append(key)
            }
        }
        return probs[end_node]
    }
}

//: [Next](@next)
