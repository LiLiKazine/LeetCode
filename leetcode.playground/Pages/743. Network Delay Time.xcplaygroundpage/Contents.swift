//: [Previous](@previous)

/*
 
 743. Network Delay Time
 
 There are N network nodes, labelled 1 to N.

 Given times, a list of travel times as directed edges times[i] = (u, v, w), where u is the source node, v is the target node, and w is the time it takes for a signal to travel from source to target.

 Now, we send a signal from a certain node K. How long will it take for all nodes to receive the signal? If it is impossible, return -1.

  

 Example 1:



 Input: times = [[2,1,1],[2,3,1],[3,4,1]], N = 4, K = 2
 Output: 2
  

 Note:

 N will be in the range [1, 100].
 K will be in the range [1, N].
 The length of times will be in the range [1, 6000].
 All edges times[i] = (u, v, w) will have 1 <= u, v <= N and 0 <= w <= 100.
 
 */

class Solution {
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        let inf = Int.max / 2
        var g: [[Int]] = Array(repeating: Array(repeating: inf, count: N), count: N)
        for t in times {
            let x = t[0] - 1, y = t[1] - 1
            g[x][y] = t[2]
        }
        var dist: [Int] = Array(repeating: inf, count: N), used = Array(repeating: false, count: N)
        dist[K - 1] = 0
        for _ in 0..<N {
            var x = -1
            for y in 0..<N {
                if !used[y] && (x == -1 || dist[y] < dist[x]) {
                    x = y
                }
            }
            used[x] = true
            for y in 0..<N {
                dist[y] = min(dist[y], dist[x] + g[x][y])
            }
        }
        let ans = dist.max() ?? inf
        return ans == inf ? -1 : ans
    }
 
}


let times = [[1,2,1],[2,3,2],[1,3,2]], N = 3, K = 1
let solution = Solution()
let ans = solution.networkDelayTime(times, N, K)
ans


//: [Next](@next)
