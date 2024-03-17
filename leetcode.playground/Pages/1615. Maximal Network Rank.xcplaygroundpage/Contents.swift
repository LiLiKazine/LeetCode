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
    
    func maximalNetworkRank(_ n: Int, _ roads: [[Int]]) -> Int {
        if roads.isEmpty { return 0 }
        if roads.count == 1 { return 1 }
        var degrees = Array(repeating: 0, count: n)
        var set = Set<[Int]>()
        for road in roads {
            set.insert(road)
            degrees[road[0]] += 1
            degrees[road[1]] += 1
        }
        
        var ans = 0
        
        for i in 0..<n {
            for j in 0..<n {
                if i == j { continue }
                let minus = set.contains([i, j]) || set.contains([j, i]) ? 1 : 0
                let cnt = degrees[i] + degrees[j] - minus
                ans = max(ans, cnt)
            }
        }
//        var city1 = [Int](), city2 = [Int]()
//        for (i, degree) in degrees.enumerated() {
//            if city1.isEmpty || degrees[city1[0]] == degree {
//                city1.append(i)
//            }
//            else if degree > degrees[city1[0]] {
//                city2 = city1
//                city1 = [i]
//            } 
//            else if city2.isEmpty || degrees[city2[0]] == degree {
//                city2.append(i)
//            }
//            else if degree > degrees[city2[0]] {
//                city2 = [i]
//            }
//        }
//        
//        if city1.count > 2 {
//            for i in city1 {
//                for j in city1 {
//                    if i == j { continue }
//                    let minus = set.contains([i, j]) || set.contains([j, i]) ? 1 : 0
//                    ans = max(ans, degrees[i] + degrees[j] - minus)
//                }
//            }
//        } else {
//            let i = city1[0]
//            for j in city2 {
//                let minus = set.contains([i, j]) || set.contains([j, i]) ? 1 : 0
//                ans = max(ans, degrees[i] + degrees[j] - minus)
//            }
//        }
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
