//: [Previous](@previous)

/*
 681. Next Closest Time
 中等
 Given a time represented in the format "HH:MM", form the next closest time by reusing the current digits. There is no limit on how many times a digit can be reused.

 You may assume the given input string is always valid. For example, "01:34", "12:09" are all valid. "1:34", "12:9" are all invalid.

  

 Example 1:

 Input: time = "19:34"
 Output: "19:39"
 Explanation: The next closest time choosing from digits 1, 9, 3, 4, is 19:39, which occurs 5 minutes later.
 It is not 19:33, because this occurs 23 hours and 59 minutes later.
 Example 2:

 Input: time = "23:59"
 Output: "22:22"
 Explanation: The next closest time choosing from digits 2, 3, 5, 9, is 22:22.
 It may be assumed that the returned time is next day's time since it is smaller than the input time numerically.
  

 Constraints:

 time.length == 5
 time is a valid time in the form "HH:MM".
 0 <= HH < 24
 0 <= MM < 60
 
 */

import Foundation

class Solution {
    func nextClosestTime(_ time: String) -> String {
        var valid = Set<Int>()
        for digit in time {
            if String(digit) != ":", let value = Int(String(digit)) {
                valid.insert(value)
            }
        }
        let components = time.split(separator: ":")
        let minutes = Int(String(components[0]))! * 60 + Int(String(components[1]))!
        
        var ans = "", total = Int.max
    
        var minimum = "", minimumTotal = Int.max
        func build(with hour: Int, _ miniute: Int) {
            
            let value = hour * 60 + miniute
            let desc = String(format: "%02d:%02d", hour, miniute)
            if value > minutes && value < total {
                ans = desc
                total = value
            }
            if value < minimumTotal {
                minimum = desc
                minimumTotal = value
            }
        }
        
        func buildMiniute(with hour: Int) {
            let range = 0...59
            for a in valid {
                // if range.contains(a) {
                //     build(with: hour, a)
                // }
                for b in valid {
                    let num = a * 10 + b
                    if range.contains(num) {
                        build(with: hour, num)
                    }
                }
            }
        }
        
        func buildHour() {
            let range = 0...23
            for a in valid {
                // if range.contains(a) {
                //     buildMiniute(with: a)
                // }
                for b in valid {
                    let num = a * 10 + b
                    if range.contains(num) {
                        buildMiniute(with: num)
                    }
                }
            }
        }
        buildHour()
        return ans.isEmpty ? minimum : ans
    }
}

//: [Next](@next)
