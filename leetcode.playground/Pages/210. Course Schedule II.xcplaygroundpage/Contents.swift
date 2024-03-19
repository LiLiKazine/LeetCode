//: [Previous](@previous)

/*
 210. Course Schedule II
 中等
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

 For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
 Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

  

 Example 1:

 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: [0,1]
 Explanation: There are a total of 2 courses to take. To take course 1 you should have finished course 0. So the correct course order is [0,1].
 Example 2:

 Input: numCourses = 4, prerequisites = [[1,0],[2,0],[3,1],[3,2]]
 Output: [0,2,1,3]
 Explanation: There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2. Both courses 1 and 2 should be taken after you finished course 0.
 So one correct course order is [0,1,2,3]. Another correct ordering is [0,2,1,3].
 Example 3:

 Input: numCourses = 1, prerequisites = []
 Output: [0]
  

 Constraints:

 1 <= numCourses <= 2000
 0 <= prerequisites.length <= numCourses * (numCourses - 1)
 prerequisites[i].length == 2
 0 <= ai, bi < numCourses
 ai != bi
 All the pairs [ai, bi] are distinct.

 */

import Foundation

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {

        var indegrees = Array(repeating: 0, count: numCourses)
        var nexts = Array(repeating: [Int](), count: numCourses)
        for prerequisite in prerequisites {
            indegrees[prerequisite[0]] += 1
            nexts[prerequisite[1]].append(prerequisite[0])
        }
        
        var q = [Int]()
        for (i, indegree) in indegrees.enumerated() {
            if indegree == 0 {
                q.append(i)
            }
        }
        var ans = [Int]()
        while q.count > 0 {
            let course = q.removeFirst()
            ans.append(course)
            for course in nexts[course] {
                if indegrees[course] == 1 {
                    q.append(course)
                } else {
                    indegrees[course] -= 1
                }
            }
        }
        return ans.count == numCourses ? ans : []
    }
}

//: [Next](@next)
