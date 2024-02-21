//: [Previous](@previous)

/*
 1136. Parallel Courses
 中等
 
 You are given an integer n, which indicates that there are n courses labeled from 1 to n. You are also given an array relations where relations[i] = [prevCoursei, nextCoursei], representing a prerequisite relationship between course prevCoursei and course nextCoursei: course prevCoursei has to be taken before course nextCoursei.

 In one semester, you can take any number of courses as long as you have taken all the prerequisites in the previous semester for the courses you are taking.

 Return the minimum number of semesters needed to take all courses. If there is no way to take all the courses, return -1.

  

 Example 1:


 Input: n = 3, relations = [[1,3],[2,3]]
 Output: 2
 Explanation: The figure above represents the given graph.
 In the first semester, you can take courses 1 and 2.
 In the second semester, you can take course 3.
 Example 2:


 Input: n = 3, relations = [[1,2],[2,3],[3,1]]
 Output: -1
 Explanation: No course can be studied because they are prerequisites of each other.
  

 Constraints:

 1 <= n <= 5000
 1 <= relations.length <= 5000
 relations[i].length == 2
 1 <= prevCoursei, nextCoursei <= n
 prevCoursei != nextCoursei
 All the pairs [prevCoursei, nextCoursei] are unique.
 
 */

import Foundation

class Solution {
    var route = [Int: [Int]]()
    var incount = [Int]()
    func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
        incount = Array(repeating: 0, count: n + 1)
        for relation in relations {
            let arr = route[relation[0]] ?? []
            route[relation[0]] = arr + [relation[1]]
            incount[relation[1]] += 1
        }
        
        var queue = [Int]()
        for i in 1...n {
            if incount[i] == 0 {
                queue.append(i)
            }
        }
        var studied = 0
        var sem = 0
        while !queue.isEmpty {
            sem += 1
            var nextQueue = Set<Int>()
            for course in queue {
                studied += 1
                if let nextCourses = route[course], nextCourses.count > 0 {
                    for nextCourse in nextCourses {
                        incount[nextCourse] -= 1
                        if incount[nextCourse] == 0 {
                            nextQueue.insert(nextCourse)
                        }
                    }
                }
                queue = Array(nextQueue)
            }
        }
        return studied == n ? sem : -1
        
    }
    
}

//: [Next](@next)
