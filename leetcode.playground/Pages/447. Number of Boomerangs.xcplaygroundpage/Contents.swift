//: [Previous](@previous)

/*
 
 447. Number of Boomerangs
 
 You are given n points in the plane that are all distinct, where points[i] = [xi, yi]. A boomerang is a tuple of points (i, j, k) such that the distance between i and j equals the distance between i and k (the order of the tuple matters).

 Return the number of boomerangs.

  

 Example 1:

 Input: points = [[0,0],[1,0],[2,0]]
 Output: 2
 Explanation: The two boomerangs are [[1,0],[0,0],[2,0]] and [[1,0],[2,0],[0,0]].
 Example 2:

 Input: points = [[1,1],[2,2],[3,3]]
 Output: 2
 Example 3:

 Input: points = [[1,1]]
 Output: 0
  

 Constraints:

 n == points.length
 1 <= n <= 500
 points[i].length == 2
 -104 <= xi, yi <= 104
 All the points are unique.
 
 */

class Solution {
    func numberOfBoomerangs(_ points: [[Int]]) -> Int {
        var ans = 0
        for origin in points {
            var dict: [Int: [Int]] = [:]
            for (i, point) in points.enumerated() {
                let dis = (origin[0] - point[0]) * (origin[0] - point[0]) + (origin[1] - point[1]) * (origin[1] - point[1])
                dict[dis] = (dict[dis] ?? []) + [i]
            }
            ans = dict.values.reduce(ans) { res, arr in
                return res + arr.count * (arr.count - 1)
            }
        }
        return ans
    }
}

let points = [[1,1],[2,2],[3,3]]
let solution = Solution()
let ans = solution.numberOfBoomerangs(points)

//: [Next](@next)
