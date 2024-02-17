//: [Previous](@previous)

/*
 253. Meeting Rooms II
 
 Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.

  

 Example 1:

 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: 2
 Example 2:

 Input: intervals = [[7,10],[2,4]]
 Output: 1
  

 Constraints:

 1 <= intervals.length <= 104
 0 <= starti < endi <= 106
 
 */

import Foundation

class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.count <= 1 { return intervals.count }
        let intervals = intervals.sorted { a, b in
            if a[0] == b[0] { return a[1] <= b[1] }
            return a[0] < b[0]
        }
        var rooms = [Int]()
        for interval in intervals {
            if rooms.isEmpty {
                rooms.append(interval[1])
            } else {
                var settled = false
                for i in 0..<rooms.count {
                    if rooms[i] <= interval[0] {
                        rooms[i] = interval[1]
                        settled = true
                        break
                    }
                }
                if !settled {
                    rooms.append(interval[1])
                }
            }
        }
        return rooms.count
    }
}

//: [Next](@next)
