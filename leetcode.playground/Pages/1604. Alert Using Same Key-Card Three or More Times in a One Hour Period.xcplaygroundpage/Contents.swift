//: [Previous](@previous)

/*
 
 1604. Alert Using Same Key-Card Three or More Times in a One Hour Period
 
 LeetCode company workers use key-cards to unlock office doors. Each time a worker uses their key-card, the security system saves the worker's name and the time when it was used. The system emits an alert if any worker uses the key-card three or more times in a one-hour period.

 You are given a list of strings keyName and keyTime where [keyName[i], keyTime[i]] corresponds to a person's name and the time when their key-card was used in a single day.

 Access times are given in the 24-hour time format "HH:MM", such as "23:51" and "09:49".

 Return a list of unique worker names who received an alert for frequent keycard use. Sort the names in ascending order alphabetically.

 Notice that "10:00" - "11:00" is considered to be within a one-hour period, while "22:51" - "23:52" is not considered to be within a one-hour period.

  

 Example 1:

 Input: keyName = ["daniel","daniel","daniel","luis","luis","luis","luis"], keyTime = ["10:00","10:40","11:00","09:00","11:00","13:00","15:00"]
 Output: ["daniel"]
 Explanation: "daniel" used the keycard 3 times in a one-hour period ("10:00","10:40", "11:00").
 Example 2:

 Input: keyName = ["alice","alice","alice","bob","bob","bob","bob"], keyTime = ["12:01","12:00","18:00","21:00","21:20","21:30","23:00"]
 Output: ["bob"]
 Explanation: "bob" used the keycard 3 times in a one-hour period ("21:00","21:20", "21:30").
  

 Constraints:

 1 <= keyName.length, keyTime.length <= 105
 keyName.length == keyTime.length
 keyTime[i] is in the format "HH:MM".
 [keyName[i], keyTime[i]] is unique.
 1 <= keyName[i].length <= 10
 keyName[i] contains only lowercase English letters.
 
 */

class Solution {
    
    let hourMinutes = 60
    
    func alertNames(_ keyName: [String], _ keyTime: [String]) -> [String] {
        
        var dict: [String: [Int]] = [:], names: Set<String> = .init()
        
        for i in 0..<keyName.count {
            let name = keyName[i], time = keyTime[i]
            
            let minutes = Int(time[Range(.init(location: 0, length: 2), in: time)!])! * 60 + Int(time[Range(.init(location: 3, length: 2), in: time)!])!
            if dict[name] == nil {
                dict[name] = [minutes]
                continue
            }
            dict[name]?.append(minutes)
        }
        for key in dict.keys {
            let times = dict[key]!.sorted()
            if valid(in: times) {
                names.insert(key)
            }
        }
        
        return names.sorted()
    }
    
    func valid(in times: [Int]) -> Bool {
        var head = 1, tail = 0
        while head - tail < 3 {
            guard times.count > head else { return false }
            if times[head] - times[tail] <= hourMinutes {
                head += 1
            } else {
                tail += 1
            }
        }
        return true
    }
}

//let keyName = ["daniel","daniel","daniel","luis","luis","luis","luis"], keyTime = ["10:00","10:40","11:00","09:00","11:00","13:00","15:00"]
let keyName = ["alice","alice","alice","bob","bob","bob","bob"], keyTime = ["12:01","12:00","18:00","21:00","21:20","21:30","23:00"]
let solution = Solution()
let ans = solution.alertNames(keyName, keyTime)
print(ans)

//: [Next](@next)
