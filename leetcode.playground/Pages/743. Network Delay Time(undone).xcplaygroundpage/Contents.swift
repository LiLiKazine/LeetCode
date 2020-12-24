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
        var time = 0, map: [[Int: Int]] = Array(repeating: [:], count: N + 1)
        for t in times {
            map[t[0]][t[1]] = t[2]
        }
        var ans = Array(repeating: -1, count: N + 1),
        points = [K]
        ans[0] = 0
        ans[K] = 0
        while !points.isEmpty {
            var temp = [Int](), maxTime = 0
            for point in points {
                let nexts = map[point]
                for key in nexts.keys {
                    if ans[key] == -1 {
                        ans[key] = nexts[key]!
                        temp.append(key)
                    }
                }
            }
            points = temp
            time += 1
        }
        
        return time
    }
}

let times = [[2,1,1],[2,3,1],[3,4,1]], N = 4, K = 2
let solution = Solution()
let ans = solution.networkDelayTime(times, N, K)
ans


//: [Next](@next)
