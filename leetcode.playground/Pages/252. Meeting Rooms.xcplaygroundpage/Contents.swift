//: [Previous](@previous)

/*
 252. Meeting Rooms
 
 Given an array of meeting time intervals where intervals[i] = [starti, endi], determine if a person could attend all meetings.

  

 Example 1:

 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: false
 Example 2:

 Input: intervals = [[7,10],[2,4]]
 Output: true
  

 Constraints:

 0 <= intervals.length <= 104
 intervals[i].length == 2
 0 <= starti < endi <= 106
 
 */

import Foundation

class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        if intervals.count <= 1 { return true }
        let intervals = intervals.sorted { a, b in
            if a[0] == b[0] { return a[1] <= b[1] }
            return a[0] < b[0]
        }
        for i in 1..<intervals.count {
            if intervals[i][0] < intervals[i-1][1] {
                return false
            }
        }
        return true
    }
}

//: [Next](@next)
