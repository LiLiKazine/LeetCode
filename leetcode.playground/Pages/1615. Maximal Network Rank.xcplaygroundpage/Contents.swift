//: [Previous](@previous)

/*
 
 1615. Maximal Network Rank
 
 There is an infrastructure of n cities with some number of roads connecting these cities. Each roads[i] = [ai, bi] indicates that there is a bidirectional road between cities ai and bi.

 The network rank of two different cities is defined as the total number of directly connected roads to either city. If a road is directly connected to both cities, it is only counted once.

 The maximal network rank of the infrastructure is the maximum network rank of all pairs of different cities.

 Given the integer n and the array roads, return the maximal network rank of the entire infrastructure.

  

 Example 1:



 Input: n = 4, roads = [[0,1],[0,3],[1,2],[1,3]]
 Output: 4
 Explanation: The network rank of cities 0 and 1 is 4 as there are 4 roads that are connected to either 0 or 1. The road between 0 and 1 is only counted once.
 Example 2:



 Input: n = 5, roads = [[0,1],[0,3],[1,2],[1,3],[2,3],[2,4]]
 Output: 5
 Explanation: There are 5 roads that are connected to cities 1 or 2.
 Example 3:

 Input: n = 8, roads = [[0,1],[1,2],[2,3],[2,4],[5,6],[5,7]]
 Output: 5
 Explanation: The network rank of 2 and 5 is 5. Notice that all the cities do not have to be connected.
  

 Constraints:

 2 <= n <= 100
 0 <= roads.length <= n * (n - 1) / 2
 roads[i].length == 2
 0 <= ai, bi <= n-1
 ai != bi
 Each pair of cities has at most one road connecting them.
 
 */

class Solution {
    
    struct Key: Hashable {
        let a: Int
        let b: Int
    }
    
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        if roads.isEmpty { return 0 }
        if roads.count == 1 { return 1 }
        
        var ans = 0, connection: Set<Key> = .init(), rank: [Int: Int] = [:]
        
        for road in roads {
            
            let key = Key(a: road[0], b: road[1])
            connection.insert(key)
            
            rank[road[0]] = (rank[road[0]] ?? 0) + 1
            rank[road[1]] = (rank[road[1]] ?? 0) + 1
            
        }
        
        let pairs = rank.sorted { $0.value > $1.value }
        for i in 0..<pairs.count-1 {
            for j in i+1..<pairs.count {
                let v1 = pairs[i].value, a = pairs[i].key, v2 = pairs[j].value, b = pairs[j].key
                var tmp = v1 + v2
                if connection.contains(Key(a: a, b: b)) || connection.contains(Key(a: b, b: a)) {
                    tmp -= 1
                }
                if tmp > ans {
                    ans = tmp
                } else {
                    break
                }
            }
        }
        return ans
    }
}

//let n = 4, roads = [[0,1],[0,3],[1,2],[1,3]]
//let n = 5, roads = [[0,1],[0,3],[1,2],[1,3],[2,3],[2,4]]
let n = 8, roads = [[0,1],[1,2],[2,3],[2,4],[5,6],[5,7]]
let solution = Solution()
let ans = solution.maximalNetworkRank(n, roads)

print(ans)

//: [Next](@next)
