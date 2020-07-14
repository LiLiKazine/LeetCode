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

/*
 
 dp[i][j] = min(dp[i+1][j], dp[i+1][j+1) + triangle[i][j]
 
 */

class Solution {
    var cache: [Int:Int] = [:]
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let depth = triangle.count
        if depth == 0 {
            return 0
        }
        let width = triangle[depth-1].count
        for j in 0..<width {
            let i = depth-1
            cache[index(i, j)] = triangle[i][j]
        }
        dp(0, 0, triangle)
        return cache[0] ?? 0
    }
    
    func dp(_ i: Int, _ j: Int, _ triangle: [[Int]]) -> Int {
        if let val = cache[index(i, j)] {
            return val
        }
        cache[index(i, j)] = min(dp(i+1, j, triangle), dp(i+1, j+1, triangle)) + triangle[i][j]
        print(i, j, cache[index(i, j)]!)
        return cache[index(i, j)]!
    }
    
    func index(_ i: Int, _ j: Int) ->Int {
        return Int(Double(i+1)*(Double(i)/2)) + j
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
