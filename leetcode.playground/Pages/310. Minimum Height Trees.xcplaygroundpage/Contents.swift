//: [Previous](@previous)

/*
 310. Minimum Height Trees
 中等
 A tree is an undirected graph in which any two vertices are connected by exactly one path. In other words, any connected graph without simple cycles is a tree.

 Given a tree of n nodes labelled from 0 to n - 1, and an array of n - 1 edges where edges[i] = [ai, bi] indicates that there is an undirected edge between the two nodes ai and bi in the tree, you can choose any node of the tree as the root. When you select a node x as the root, the result tree has height h. Among all possible rooted trees, those with minimum height (i.e. min(h))  are called minimum height trees (MHTs).

 Return a list of all MHTs' root labels. You can return the answer in any order.

 The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.

  

 Example 1:


 Input: n = 4, edges = [[1,0],[1,2],[1,3]]
 Output: [1]
 Explanation: As shown, the height of the tree is 1 when the root is the node with label 1 which is the only MHT.
 Example 2:


 Input: n = 6, edges = [[3,0],[3,1],[3,2],[3,4],[5,4]]
 Output: [3,4]
  

 Constraints:

 1 <= n <= 2 * 104
 edges.length == n - 1
 0 <= ai, bi < n
 ai != bi
 All the pairs (ai, bi) are distinct.
 The given input is guaranteed to be a tree and there will be no repeated edges.
 
 */

import Foundation

class Solution {
    
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        
        var map = [Int: [Int]]()
        
        func addRoute(_ a: Int, _ b: Int) {
            let children = map[a] ?? []
            map[a] = children + [b]
        }
        for edge in edges {
            addRoute(edge[0], edge[1])
            addRoute(edge[1], edge[0])
        }
        
        var heights = Array(repeating: 0, count: n)
        
        func find(_ node: Int, _ prev: Int) -> Int {
            if let children = map[node] {
                var ans = 1
                for child in children where child != prev {
                    ans = max(ans, 1 + find(child, node))
                }
                return ans
            } else {
                return 1
            }
        }
        
        for root in 0..<n {
            heights[root] = find(root, -1)
        }
        
        var ans = [Int]()
        for (i, height) in heights.enumerated() {
            if ans.isEmpty {
                ans.append(i)
            } else if heights[ans[0]] == height {
                ans.append(i)
            } else if heights[ans[0]] > height {
                ans = [i]
            }
        }
        return ans
    }
}

/*
 class Solution:
     def findMinHeightTrees(self, n: int, edges: List[List[int]]) -> List[int]:
         if n == 1:
             return [0]

         g = [[] for _ in range(n)]
         for x, y in edges:
             g[x].append(y)
             g[y].append(x)
         parents = [0] * n

         def bfs(start: int):
             vis = [False] * n
             vis[start] = True
             q = deque([start])
             while q:
                 x = q.popleft()
                 for y in g[x]:
                     if not vis[y]:
                         vis[y] = True
                         parents[y] = x
                         q.append(y)
             return x
         x = bfs(0)  # 找到与节点 0 最远的节点 x
         y = bfs(x)  # 找到与节点 x 最远的节点 y

         path = []
         parents[x] = -1
         while y != -1:
             path.append(y)
             y = parents[y]
         m = len(path)
         return [path[m // 2]] if m % 2 else [path[m // 2 - 1], path[m // 2]]
 */

//: [Next](@next)
