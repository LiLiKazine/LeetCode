//: [Previous](@previous)

/*
 
 802. Find Eventual Safe States
 
 We start at some node in a directed graph, and every turn, we walk along a directed edge of the graph. If we reach a terminal node (that is, it has no outgoing directed edges), we stop.

 We define a starting node to be safe if we must eventually walk to a terminal node. More specifically, there is a natural number k, so that we must have stopped at a terminal node in less than k steps for any choice of where to walk.

 Return an array containing all the safe nodes of the graph. The answer should be sorted in ascending order.

 The directed graph has n nodes with labels from 0 to n - 1, where n is the length of graph. The graph is given in the following form: graph[i] is a list of labels j such that (i, j) is a directed edge of the graph, going from node i to node j.

  

 Example 1:

 Illustration of graph
 Input: graph = [[1,2],[2,3],[5],[0],[5],[],[]]
 Output: [2,4,5,6]
 Explanation: The given graph is shown above.
 Example 2:

 Input: graph = [[1,2,3,4],[1,2],[3,4],[0,4],[]]
 Output: [4]
  

 Constraints:

 n == graph.length
 1 <= n <= 104
 0 <= graph[i].length <= n
 graph[i] is sorted in a strictly increasing order.
 The graph may contain self-loops.
 The number of edges in the graph will be in the range [1, 4 * 104].
 
 */

class Solution {
        
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var safe = Array(repeating: 0, count: graph.count)
        var visited = Array(repeating: false, count: graph.count)
        func search(from node: Int) -> Bool {
            if safe[node] == 1 {
                return true
            }
            if safe[node] == -1 {
                return false
            }
            if visited[node] {
                safe[node] = -1
                return false
            }
            visited[node] = true
            let nexts = graph[node]
            if nexts.isEmpty {
                safe[node] = 1
                return true
            }
            var res = true
            for next in nexts {
                res = res && search(from: next)
            }
            safe[node] = res ? 1 : -1
            return res
        }
        
        for i in 0..<graph.count {
            search(from: i)
        }
        
        var ans = [Int]()
        for i in 0..<graph.count {
            if safe[i] == 1 {
                ans.append(safe[i])
            }
        }
        return ans
    }
    
}

/*
class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var color = Array(repeating: 0, count: n)
        
        func safe(_ x: Int) -> Bool {
            if color[x] > 0 {
                return color[x] == 2
            }
            color[x] = 1
            for y in graph[x] {
                if !safe(y) {
                    return false
                }
            }
            color[x] = 2
            return true
        }
        
        var ans: [Int] = []
        for i in 0..<n {
            if safe(i) {
                ans.append(i)
            }
        }
        return ans
    }
}
*/

//: [Next](@next)
