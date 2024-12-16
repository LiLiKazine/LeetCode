//: [Previous](@previous)

/*
 1847. Closest Room
 困难
 There is a hotel with n rooms. The rooms are represented by a 2D integer array rooms where rooms[i] = [roomIdi, sizei] denotes that there is a room with room number roomIdi and size equal to sizei. Each roomIdi is guaranteed to be unique.

 You are also given k queries in a 2D array queries where queries[j] = [preferredj, minSizej]. The answer to the jth query is the room number id of a room such that:

 The room has a size of at least minSizej, and
 abs(id - preferredj) is minimized, where abs(x) is the absolute value of x.
 If there is a tie in the absolute difference, then use the room with the smallest such id. If there is no such room, the answer is -1.

 Return an array answer of length k where answer[j] contains the answer to the jth query.

  

 Example 1:

 Input: rooms = [[2,2],[1,2],[3,2]], queries = [[3,1],[3,3],[5,2]]
 Output: [3,-1,3]
 Explanation: The answers to the queries are as follows:
 Query = [3,1]: Room number 3 is the closest as abs(3 - 3) = 0, and its size of 2 is at least 1. The answer is 3.
 Query = [3,3]: There are no rooms with a size of at least 3, so the answer is -1.
 Query = [5,2]: Room number 3 is the closest as abs(3 - 5) = 2, and its size of 2 is at least 2. The answer is 3.
 Example 2:

 Input: rooms = [[1,4],[2,3],[3,5],[4,1],[5,2]], queries = [[2,3],[2,4],[2,5]]
 Output: [2,1,3]
 Explanation: The answers to the queries are as follows:
 Query = [2,3]: Room number 2 is the closest as abs(2 - 2) = 0, and its size of 3 is at least 3. The answer is 2.
 Query = [2,4]: Room numbers 1 and 3 both have sizes of at least 4. The answer is 1 since it is smaller.
 Query = [2,5]: Room number 3 is the only room with a size of at least 5. The answer is 3.
  

 Constraints:

 n == rooms.length
 1 <= n <= 105
 k == queries.length
 1 <= k <= 104
 1 <= roomIdi, preferredj <= 107
 1 <= sizei, minSizej <= 107
 */


import Foundation

class Solution {
    func closestRoom(_ rooms: [[Int]], _ queries: [[Int]]) -> [Int] {
        let len = queries.count
        
        let queries = queries.enumerated().sorted {
            $0.element[1] > $1.element[1]
        }
        let rooms = rooms.sorted { $0[1] > $1[1] }
        var buffer = [Int]()
        
        var offset = 0
        
        func lowerBounds(_ x: Int) -> Int {
            var l = 0, r = buffer.count
            while l < r {
                let mid = l + (r - l) / 2
                if buffer[mid] < x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l
        }
        var ans = Array(repeating: -1, count: queries.count)
        for query in queries {
            let index = query.offset, preferred = query.element[0], size = query.element[1]
            for i in offset..<rooms.count {
                if rooms[i][1] >= size {
                    buffer.append(rooms[i][0])
                } else {
                    offset = i
                    break
                }
            }
            buffer.sort()
            let l = lowerBounds(preferred)
            if l == buffer.count {
                ans[index] = l == 0 ? -1 : buffer[l-1]
                continue
            }
            if l == 0 {
                ans[index] = buffer[l]
                continue
            }
            if abs(preferred - buffer[l]) < abs(preferred - buffer[l-1]) {
                ans[index] = buffer[l]
            } else {
                ans[index] = buffer[l-1]
            }
        }
        
        return ans
    }
}


//: [Next](@next)
