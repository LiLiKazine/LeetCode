//: [Previous](@previous)

/*
 
 面试题 04.01. Route Between Nodes LCCI
 
 Given a directed graph, design an algorithm to find out whether there is a route between two nodes.

 Example1:

  Input: n = 3, graph = [[0, 1], [0, 2], [1, 2], [1, 2]], start = 0, target = 2
  Output: true
 Example2:

  Input: n = 5, graph = [[0, 1], [0, 2], [0, 4], [0, 4], [0, 1], [1, 3], [1, 4], [1, 3], [2, 3], [3, 4]], start = 0, target = 4
  Output true
 Note:

 0 <= n <= 100000
 All node numbers are within the range [0, n].
 There might be self cycles and duplicated edges.
 
 */

class Solution {
    func findWhetherExistsPath(_ n: Int, _ graph: [[Int]], _ start: Int, _ target: Int) -> Bool {
        var map: [Set<Int>] = Array(repeating: Set(), count: n),
        dp = Array(repeating: 0, count: n)
        for edge in graph {
            let start = edge[0]
            let end = edge[1]
            map[start].insert(end)
        }
        var starts = [start]
        while !starts.isEmpty {
            var nextStarts: [Int] = []
            for start in starts {
                if dp[start] == 1 {
                    continue
                }
                for next in map[start] {
                    if next == target {
                        return true
                    }
                    if dp[next] == 0 {
                        nextStarts.append(next)
                    }
                }
                dp[start] = 1
            }
            starts = nextStarts
        }
        return false
    }
}

let n = 25,
graph = [[0, 1], [0, 3], [0, 10], [0, 18], [1, 2], [1, 7], [1, 11], [1, 12], [2, 4], [2, 5], [2, 13], [2, 16], [3, 6], [3, 8], [4, 9], [5, 17], [7, 20], [7, 22], [8, 10], [10, 19], [11, 15], [13, 14], [14, 21], [15, 23], [19, 24], [20, 22]],
start = 0,
target = 12
//let n = 5, graph = [[0, 1], [0, 2], [0, 4], [0, 4], [0, 1], [1, 3], [1, 4], [1, 3], [2, 3], [3, 4]], start = 0, target = 4
let solution = Solution()
let ans = solution.findWhetherExistsPath(n, graph, start, target)
ans

//: [Next](@next)
