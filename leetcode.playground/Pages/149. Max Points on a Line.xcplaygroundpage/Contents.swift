//: [Previous](@previous)

/*
 
 149. Max Points on a Line
 
 Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

  

 Example 1:


 Input: points = [[1,1],[2,2],[3,3]]
 Output: 3
 Example 2:


 Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
 Output: 4
  

 Constraints:

 1 <= points.length <= 300
 points[i].length == 2
 -104 <= xi, yi <= 104
 All the points are unique.
 
 */

class Solution {
    
    private struct Slope : Hashable {
        private(set) var no: Int = 0
        private(set) var de: Int = 0
        
        init(_ nominator: Int, _ denominator: Int) {
            var nominator = denominator == 0 ? 1 : nominator
            var denominator = nominator == 0 ? 1 : denominator
            if (nominator < 0) {
                nominator = -nominator;
                denominator = -denominator;
            }
            let divider = gcd(abs(nominator), abs(denominator))
            no = nominator / divider
            de = denominator / divider
        }
        
        private func gcd(_ a: Int, _ b: Int) -> Int {
            if b == 0 {
                return a
            } else {
                return gcd(b, a % b)
            }
        }

    }
    
    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count > 2 else {
            return points.count
        }
        
        var ret = 0
        for i in 0..<points.count {
            if ret > points.count - i || ret > points.count / 2 {
                break
            }
            var slopDict: [Slope: Int] = [:]
            for j in i + 1..<points.count {
                let x1 = points[i][0], y1 = points[i][1],
                    x2 = points[j][0], y2 = points[j][1]
                let slope = Slope(y2 - y1, x2 - x1)
                slopDict[slope] = (slopDict[slope] ?? 0) + 1
            }
            var num = 0
            for val in slopDict.values {
                num = max(num, val + 1)
            }
            ret = max(ret, num)
        }
        return ret
    }
}

//let points = [[1,1],[2,2],[3,3]]
let points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
let solution = Solution()
let ans = solution.maxPoints(points)
ans

//: [Next](@next)
