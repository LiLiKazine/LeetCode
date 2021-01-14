//: [Previous](@previous)

/*
 
 684. Redundant Connection
 
 In this problem, a tree is an undirected graph that is connected and has no cycles.

 The given input is a graph that started as a tree with N nodes (with distinct values 1, 2, ..., N), with one additional edge added. The added edge has two different vertices chosen from 1 to N, and was not an edge that already existed.

 The resulting graph is given as a 2D-array of edges. Each element of edges is a pair [u, v] with u < v, that represents an undirected edge connecting nodes u and v.

 Return an edge that can be removed so that the resulting graph is a tree of N nodes. If there are multiple answers, return the answer that occurs last in the given 2D-array. The answer edge [u, v] should be in the same format, with u < v.

 Example 1:
 Input: [[1,2], [1,3], [2,3]]
 Output: [2,3]
 Explanation: The given undirected graph will be like this:
   1
  / \
 2 - 3
 Example 2:
 Input: [[1,2], [2,3], [3,4], [1,4], [1,5]]
 Output: [1,4]
 Explanation: The given undirected graph will be like this:
 5 - 1 - 2
     |   |
     4 - 3
 Note:
 The size of the input 2D-array will be between 3 and 1000.
 Every integer represented in the 2D-array will be between 1 and N, where N is the size of the input array.

 Update (2017-09-26):
 We have overhauled the problem description + test cases and specified clearly the graph is an undirected graph. For the directed graph follow up please see Redundant Connection II). We apologize for any inconvenience caused.
 
 */

/*
 
 class Solution {
     public int[] findRedundantConnection(int[][] edges) {
         int nodesCount = edges.length;
         int[] parent = new int[nodesCount + 1];
         for (int i = 1; i <= nodesCount; i++) {
             parent[i] = i;
         }
         for (int i = 0; i < nodesCount; i++) {
             int[] edge = edges[i];
             int node1 = edge[0], node2 = edge[1];
             if (find(parent, node1) != find(parent, node2)) {
                 union(parent, node1, node2);
             } else {
                 return edge;
             }
         }
         return new int[0];
     }

     public void union(int[] parent, int index1, int index2) {
         parent[find(parent, index1)] = find(parent, index2);
     }

     public int find(int[] parent, int index) {
         if (parent[index] != index) {
             parent[index] = find(parent, parent[index]);
         }
         return parent[index];
     }
 }
 A % 5 * 2 % 5 == A * 2 % 5
 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/redundant-connection/solution/rong-yu-lian-jie-by-leetcode-solution-pks2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let nodeNum = edges.count
        var union: [Int] = []
        for i in 0..<nodeNum {
            union.append(i)
        }
        for edge in edges {
            let node1 = edge[0] - 1, node2 = edge[1] - 1
            guard findGroup(&union, node1) != findGroup(&union, node2) else {
                return edge
            }
            unit(&union, node1, node2)
        }
        return []
    }
    
    func unit(_ union: inout [Int], _ node1: Int, _ node2: Int) {
        union[findGroup(&union, node1)] = findGroup(&union, node2)
    }
     
    func findGroup(_ union: inout [Int], _ node: Int) -> Int {
        guard union[node] != node else {
            return union[node]
        }
        union[node] = findGroup(&union, union[node])
        return union[node]
    }
}

let edges = [[1,2],[1,3],[2,3]]

let solution = Solution()
let ans = solution.findRedundantConnection(edges)
ans

//: [Next](@next)
