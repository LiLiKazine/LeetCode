//: [Previous](@previous)

/*
 1135. Connecting Cities With Minimum Cost
 中等
 There are n cities labeled from 1 to n. You are given the integer n and an array connections where connections[i] = [xi, yi, costi] indicates that the cost of connecting city xi and city yi (bidirectional connection) is costi.

 Return the minimum cost to connect all the n cities such that there is at least one path between each pair of cities. If it is impossible to connect all the n cities, return -1,

 The cost is the sum of the connections' costs used.

  

 Example 1:


 Input: n = 3, connections = [[1,2,5],[1,3,6],[2,3,1]]
 Output: 6
 Explanation: Choosing any 2 edges will connect all cities so we choose the minimum 2.
 Example 2:


 Input: n = 4, connections = [[1,2,3],[3,4,4]]
 Output: -1
 Explanation: There is no way to connect all cities even if all edges are used.
  

 Constraints:

 1 <= n <= 104
 1 <= connections.length <= 104
 connections[i].length == 3
 1 <= xi, yi <= n
 xi != yi
 0 <= costi <= 105
 
 */

import Foundation

class Solution {
    func minimumCost(_ n: Int, _ connections: [[Int]]) -> Int {

        var union = Array(0...n)
        var sizeList = Array(repeating: 1, count: n + 1)
        let connections = connections.sorted { e1, e2 in
            return e1[2] <= e2[2]
        }
        
        func find(_ val: Int) -> Int {
            if union[val] == val {
                return val
            }
            union[val] = find(union[val])
            let cnt = sizeList[val]
            sizeList[val] = 0
            sizeList[union[val]] += cnt
            return union[val]
        }
        
        func combine(_ a: Int, _ b: Int) {
            if find(a) == find(b) {
                return
            }
            
            if sizeList[find(a)] > sizeList[find(b)] {
                union[find(b)] = find(a)
            } else {
                union[find(a)] = find(b)
            }
        }
        var edge: Int = 0, sum: Int = 0
        for connection in connections {
            let a = connection[0], b = connection[1], cost = connection[2]
            let rootA = find(a), rootB = find(b)
            if rootA == rootB {
                continue
            }
            combine(a, b)
            edge += 1
            sum += cost
            if edge == n - 1 {
                break
            }
        }
        return edge == n - 1 ? sum : -1
    }
}

//: [Next](@next)
