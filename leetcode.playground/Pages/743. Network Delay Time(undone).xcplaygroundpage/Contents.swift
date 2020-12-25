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
    var map: [[Int: Int]] = [], traversed: [Int: Bool] = [:]
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        map = Array(repeating: [:], count: N + 1)
        map[0][K] = 0
        for t in times {
            map[t[0]][t[1]] = t[2]
        }
        traversed[K] = true
        let time = traverse(0, [K])
        if traversed.keys.count != N {
            return -1
        }
        return time
    }
    
    func traverse(_ from: Int, _ points: [Int]) -> Int {
        var time = 0
        for point in points {
            traversed[point] = true
            let nexts = map[point]
            var temp: [Int] = []
            for key in nexts.keys {
                if traversed[key] == true {
                    continue
                }
                temp.append(key)
            }
            time = max(time, map[from][point]! + traverse(point, temp))
        }
        return time
    }
}


let times = [[1,2,1],[2,3,2],[1,3,2]], N = 3, K = 1
let solution = Solution()
let ans = solution.networkDelayTime(times, N, K)
ans


//: [Next](@next)
