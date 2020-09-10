//: [Previous](@previous)

/*
 
 636. Exclusive Time of Functions
 
 On a single threaded CPU, we execute some functions.  Each function has a unique id between 0 and N-1.

 We store logs in timestamp order that describe when a function is entered or exited.

 Each log is a string with this format: "{function_id}:{"start" | "end"}:{timestamp}".  For example, "0:start:3" means the function with id 0 started at the beginning of timestamp 3.  "1:end:2" means the function with id 1 ended at the end of timestamp 2.

 A function's exclusive time is the number of units of time spent in this function.  Note that this does not include any recursive calls to child functions.

 The CPU is single threaded which means that only one function is being executed at a given time unit.

 Return the exclusive time of each function, sorted by their function id.

  

 Example 1:



 Input:
 n = 2
 logs = ["0:start:0","1:start:2","1:end:5","0:end:6"]
 Output: [3, 4]
 Explanation:
 Function 0 starts at the beginning of time 0, then it executes 2 units of time and reaches the end of time 1.
 Now function 1 starts at the beginning of time 2, executes 4 units of time and ends at time 5.
 Function 0 is running again at the beginning of time 6, and also ends at the end of time 6, thus executing for 1 unit of time.
 So function 0 spends 2 + 1 = 3 units of total time executing, and function 1 spends 4 units of total time executing.
  

 Note:

 1 <= n <= 100
 Two functions won't start or end at the same time.
 Functions will always log when they exit.
 
 */

//: [Next](@next)

class Solution {
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var times: [Int] = Array(repeating: 0, count: n)
        var stack: [(id: Int, time: Int)] = []
        
        for task in logs {
            let infos = formatter(task)
            if let start = infos.start {
                stack.append((infos.id, start))
            }
            if let end = infos.end {
                let last = stack.removeLast()
                let time = end - last.time + 1
                times[last.id] += time
                for i in 0..<stack.count {
                    stack[i].time += time
                }
            }
        }
        return times
    }
    
    func formatter(_ task: String) -> (id: Int, start: Int?, end: Int?) {
        let arr = task.split(separator: ":");
        let id = Int(arr[0])!
        let isStart = String(arr[1]) == "start"
        let start = isStart ? Int(arr[2]) : nil
        let end = isStart ? nil : Int(arr[2])
        return (id, start, end)
    }
}

let n = 1
let logs = ["0:start:0","0:start:2","0:end:5","0:start:6","0:end:6","0:end:7"]

let solution = Solution()
let ans = solution.exclusiveTime(n, logs)
