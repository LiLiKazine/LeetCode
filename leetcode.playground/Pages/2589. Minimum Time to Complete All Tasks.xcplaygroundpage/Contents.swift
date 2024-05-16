//: [Previous](@previous)

/*
 2589. Minimum Time to Complete All Tasks
 困难
 There is a computer that can run an unlimited number of tasks at the same time. You are given a 2D integer array tasks where tasks[i] = [starti, endi, durationi] indicates that the ith task should run for a total of durationi seconds (not necessarily continuous) within the inclusive time range [starti, endi].

 You may turn on the computer only when it needs to run a task. You can also turn it off if it is idle.

 Return the minimum time during which the computer should be turned on to complete all tasks.

  

 Example 1:

 Input: tasks = [[2,3,1],[4,5,1],[1,5,2]]
 Output: 2
 Explanation:
 - The first task can be run in the inclusive time range [2, 2].
 - The second task can be run in the inclusive time range [5, 5].
 - The third task can be run in the two inclusive time ranges [2, 2] and [5, 5].
 The computer will be on for a total of 2 seconds.
 Example 2:

 Input: tasks = [[1,3,2],[2,5,3],[5,6,2]]
 Output: 4
 Explanation:
 - The first task can be run in the inclusive time range [2, 3].
 - The second task can be run in the inclusive time ranges [2, 3] and [5, 5].
 - The third task can be run in the two inclusive time range [5, 6].
 The computer will be on for a total of 4 seconds.
  

 Constraints:

 1 <= tasks.length <= 2000
 tasks[i].length == 3
 1 <= starti, endi <= 2000
 1 <= durationi <= endi - starti + 1
 
 */

import Foundation

class Solution {
    func findMinimumTime(_ tasks: [[Int]]) -> Int {
        return scan(tasks)
    }
    
    func scan(_ tasks: [[Int]]) -> Int {
        
        var i = 0, tasks = tasks, ans = 0
        while true {
            defer { i += 1 }
            var finish = true, run = false
            for task in tasks {
                let start = task[0], end = task[1], dur = task[2]
                if i <= end {
                    finish = false
                }
                if start <= i && dur > 0 && end - i + 1 == dur {
                    run = true
                }
            }
            if finish { break }
            guard run else { continue }
            for j in 0..<tasks.count {
                if tasks[j][0] <= i && tasks[j][1] >= i && tasks[j][2] > 0 {
                    tasks[j][2] -= 1
                }
            }
            ans += 1
        }
        return ans
    }
    
    func greedy(_ tasks: [[Int]]) -> Int {
        
        var tasks = tasks.sorted(by: { $0[1] <= $1[1] })
        var run = Array(repeating: 0, count: tasks[tasks.count - 1][1] + 1)
        
        var ans = 0
        
        for task in tasks {
            
            let start = task[0], end = task[1]
            var dur = task[2]
            
            for i in start...end {
                dur -= run[i]
            }
            if dur <= 0 {
                continue
            }
            ans += dur
            var i = end
            while dur > 0, i >= 0 {
                defer {
                    i -= 1
                }
                if run[i] != 0 {
                    continue
                }
                run[i] = 1
                dur -= 1
            }
        }
        
        return ans
    }
}

//: [Next](@next)
