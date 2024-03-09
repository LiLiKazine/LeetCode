//: [Previous](@previous)

/*
 1192. Critical Connections in a Network
 困难
 There are n servers numbered from 0 to n - 1 connected by undirected server-to-server connections forming a network where connections[i] = [ai, bi] represents a connection between servers ai and bi. Any server can reach other servers directly or indirectly through the network.

 A critical connection is a connection that, if removed, will make some servers unable to reach some other server.

 Return all critical connections in the network in any order.

  

 Example 1:


 Input: n = 4, connections = [[0,1],[1,2],[2,0],[1,3]]
 Output: [[1,3]]
 Explanation: [[3,1]] is also accepted.
 Example 2:

 Input: n = 2, connections = [[0,1]]
 Output: [[0,1]]
  

 Constraints:

 2 <= n <= 105
 n - 1 <= connections.length <= 105
 0 <= ai, bi <= n - 1
 ai != bi
 There are no repeated connections.
 
 */

import Foundation

class Solution {
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var map = Array(repeating: [Int](), count: n)
        for connection in connections {
            let a = connection[0], b = connection[1]
            map[a].append(b)
            map[b].append(a)
        }
        var ans = [[Int]]()
        var time = Array(repeating: 0, count: n) // dfs过程中，初次访问某个节点时的时间戳
        var low = Array(repeating: 0, count: n) // 每个节点的最小追溯值
        var num = [0] // 自增数字，用来赋值给节点的时间戳
        
        func dfs(_ server: Int, _ parent: Int) {
            num[0] += 1
            time[server] = num[0]
            low[server] = time[server]
            for next in map[server] {
                if time[next] == 0 { // 代表dfs发现新节点
                    dfs(next, server)
                    low[server] = min(low[server], low[next])
                    if low[next] > time[server] { //发现桥边，添加到结果集
                        ans.append([server, next])
                    }
                } else if time[next] < time[server] && next != parent { // next 已经在 server 之前被访问过了。因为是无向图，server 可以反向访问到其 【dfs搜索树】上的父节点，此时需要跳过。
                    low[server] = min(low[server], time[next])
                }
            }
        }
        
        dfs(0, 0) // 从顶点 0 开始dfs，并认为其 前驱节点为 0
        
        return ans
    }
}

//: [Next](@next)
