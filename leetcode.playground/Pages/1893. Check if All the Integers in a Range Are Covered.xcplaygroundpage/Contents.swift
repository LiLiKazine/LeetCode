//: [Previous](@previous)

/*
 
 1893. Check if All the Integers in a Range Are Covered
 
 You are given a 2D integer array ranges and two integers left and right. Each ranges[i] = [starti, endi] represents an inclusive interval between starti and endi.

 Return true if each integer in the inclusive range [left, right] is covered by at least one interval in ranges. Return false otherwise.

 An integer x is covered by an interval ranges[i] = [starti, endi] if starti <= x <= endi.

  

 Example 1:

 Input: ranges = [[1,2],[3,4],[5,6]], left = 2, right = 5
 Output: true
 Explanation: Every integer between 2 and 5 is covered:
 - 2 is covered by the first range.
 - 3 and 4 are covered by the second range.
 - 5 is covered by the third range.
 Example 2:

 Input: ranges = [[1,10],[10,20]], left = 21, right = 21
 Output: false
 Explanation: 21 is not covered by any range.
  

 Constraints:

 1 <= ranges.length <= 50
 1 <= starti <= endi <= 50
 1 <= left <= right <= 50
 
 */

class Solution {
    func isCovered(_ ranges: [[Int]], _ left: Int, _ right: Int) -> Bool {
        var left = left, right = right
        for range in ranges.sorted(by: { a1, a2 in
            a1[0] == a2[0] ? a1[1] < a2[1] : a1[0] < a2[0]
        }) {
            if left >= range[0] && left <= range[1] {
                left = range[1] + 1
            }
            if right >= range[0] && right <= range[1] {
                right = range[0] - 1
            }
            if left > right {
                break
            }
        }
        return left > right
    }
}
let ranges = [[2,2],[3,3],[1, 1]], left = 1, right = 3
//let ranges = [[1,2],[3,4],[5,6]], left = 2, right = 5
//let ranges = [[1,10],[10,20]], left = 21, right = 21
let solution = Solution()
let ans = solution.isCovered(ranges, left, right)
ans


//: [Next](@next)
