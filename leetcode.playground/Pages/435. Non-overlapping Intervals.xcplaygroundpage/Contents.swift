//: [Previous](@previous)

/*
 
 435. Non-overlapping Intervals
 
 Given a collection of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

  

 Example 1:

 Input: [[1,2],[2,3],[3,4],[1,3]]
 Output: 1
 Explanation: [1,3] can be removed and the rest of intervals are non-overlapping.
 Example 2:

 Input: [[1,2],[1,2],[1,2]]
 Output: 2
 Explanation: You need to remove two [1,2] to make the rest of intervals non-overlapping.
 Example 3:

 Input: [[1,2],[2,3]]
 Output: 0
 Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
  

 Note:

 You may assume the interval's end point is always bigger than its start point.
 Intervals like [1,2] and [2,3] have borders "touching" but they don't overlap each other.
 
 */

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard intervals.count > 1 else {
            return 0
        }
        var sortedIntervals = intervals.sorted { (val1, val2) -> Bool in
            if val1[0] == val2[0] {
                return val1[1] < val2[1]
            } else {
                return val1[0] < val2[0]
            }
        }
        var i = 1
        while i < sortedIntervals.count {
            let curInterval = sortedIntervals[i]
            let lastInterval = sortedIntervals[i-1]
            if curInterval[0] < lastInterval[1] {
                if lastInterval[1] > curInterval[1] {
                    sortedIntervals.remove(at: i-1)
                } else {
                    sortedIntervals.remove(at: i)
                }
            } else {
                i += 1
            }
        }
        return intervals.count - sortedIntervals.count
    }
}

let intervals =  [[1,2],[2,3],[3,4],[1,3]]
let solution = Solution()
let ans = solution.eraseOverlapIntervals(intervals)
ans

//: [Next](@next)
