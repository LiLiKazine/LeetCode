//: [Previous](@previous)

/*
 
 120. Triangle
 
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

 For example, given the following triangle

 [
      [2],
     [3,4],
    [6,5,7],
   [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

 Note:

 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 
 */

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var n = triangle.last!.count
        var dp = Array(repeating: Int.max, count: n)
        dp[0] = triangle[0][0]
        for i in 1..<triangle.count {
            var cache = dp
            print(cache)
            for j in 0..<triangle[i].count {
                if j == 0 {
                    cache[j] = dp[j] + triangle[i][j]
                } else if j == triangle[i].count - 1 {
                    cache[j] = dp[j-1] + triangle[i][j]
                } else {
                    cache[j] = min(dp[j-1], dp[j]) + triangle[i][j]
                }
            }
            dp = cache
        }
        return dp.reduce(Int.max) { partialResult, val in
            return partialResult < val ? partialResult : val
        }
    }
}

let param =  [
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
]
let solution = Solution()
let ans = solution.minimumTotal(param)
ans

//: [Next](@next)
