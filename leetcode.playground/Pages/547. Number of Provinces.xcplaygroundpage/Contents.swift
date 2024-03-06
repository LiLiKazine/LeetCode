//: [Previous](@previous)

/*
 
 547. Number of Provinces
 
 There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.

 A province is a group of directly or indirectly connected cities and no other cities outside of the group.

 You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.

 Return the total number of provinces.

  

 Example 1:


 Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
 Output: 2
 Example 2:


 Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
 Output: 3
  

 Constraints:

 1 <= n <= 200
 n == isConnected.length
 n == isConnected[i].length
 isConnected[i][j] is 1 or 0.
 isConnected[i][i] == 1
 isConnected[i][j] == isConnected[j][i]
 
 */

class Solution {
    
    var route = [Int]()
    
    func findCircleNum(_ isConnected: [[Int]]) -> Int {

        route = Array(0..<isConnected.count)
        
        for i in 0..<isConnected.count {
            for j in 0..<isConnected[i].count {
                if isConnected[i][j] == 1 {
                    connect(i, j)
                }
            }
        }
        
        var cnt = 0
        for i in 0..<route.count {
            if i == route[i] {
                cnt += 1
            }
        }
        return cnt
    }

    func connect(_ a: Int, _ b: Int) {
        let a = find(a), b = find(b)
        route[a] = b
    }
    
    func find(_ a: Int) -> Int {
        if a == route[a] {
            return a
        }
        route[a] = find(route[a])
        return route[a]
    }
    
}

/*

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let cityNum = isConnected.count
        var num = 0, visited = Array(repeating: false, count: cityNum)
        for i in 0..<cityNum {
            if visited[i] {
                continue
            }
            dfs(isConnected, &visited, i)
            num += 1
        }
        
        return num
    }
    
    func dfs(_ isConnected: [[Int]], _ visited: inout [Bool], _ i: Int) {
        for j in 0..<isConnected.count {
            guard isConnected[i][j] == 1 && !visited[j] else {
                continue
            }
            visited[j] = true
            dfs(isConnected, &visited, j)
        }
    }
}
 */

let isConnected = [[1,0,0,1],
                   [0,1,1,0],
                   [0,1,1,1],
                   [1,0,1,1]]
let solution = Solution()
let ans = solution.findCircleNum(isConnected)
ans

//: [Next](@next)
