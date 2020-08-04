//: [Previous](@previous)

/*
 
 207. Course Schedule
 
 There are a total of numCourses courses you have to take, labeled from 0 to numCourses-1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

  

 Example 1:

 Input: numCourses = 2, prerequisites = [[1,0]]
 Output: true
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0. So it is possible.
 Example 2:

 Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take.
              To take course 1 you should have finished course 0, and to take course 0 you should
              also have finished course 1. So it is impossible.
  

 Constraints:

 The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 You may assume that there are no duplicate edges in the input prerequisites.
 1 <= numCourses <= 10^5
 
 */

/*
 
 class Solution {
     public boolean canFinish(int numCourses, int[][] prerequisites) {
         int[] indegrees = new int[numCourses];
         List<List<Integer>> adjacency = new ArrayList<>();
         Queue<Integer> queue = new LinkedList<>();
         for(int i = 0; i < numCourses; i++)
             adjacency.add(new ArrayList<>());
         // Get the indegree and adjacency of every course.
         for(int[] cp : prerequisites) {
             indegrees[cp[0]]++;
             adjacency.get(cp[1]).add(cp[0]);
         }
         // Get all the courses with the indegree of 0.
         for(int i = 0; i < numCourses; i++)
             if(indegrees[i] == 0) queue.add(i);
         // BFS TopSort.
         while(!queue.isEmpty()) {
             int pre = queue.poll();
             numCourses--;
             for(int cur : adjacency.get(pre))
                 if(--indegrees[cur] == 0) queue.add(cur);
         }
         return numCourses == 0;
     }
 }

 作者：jyd
 链接：https://leetcode-cn.com/problems/course-schedule/solution/course-schedule-tuo-bu-pai-xu-bfsdfsliang-chong-fa/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var numCourses = numCourses
        var indegrees = Array<Int>(repeating: 0, count: numCourses)
        var adjacency: [[Int]] = Array(repeating: [], count: numCourses)
        var queue: [Int] = []
        for pair in prerequisites {
            indegrees[pair[0]] += 1
            adjacency[pair[1]].append(pair[0])
        }
        
        for i in 0..<numCourses {
            if indegrees[i] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let pre = queue.removeFirst()
            numCourses -= 1
            for cur in adjacency[pre] {
                indegrees[cur]-=1
                if indegrees[cur] == 0 {
                    queue.append(cur)
                }
            }
        }
        return numCourses == 0
    }
}
let solution = Solution()
let ans = solution.canFinish(3, [[1,0],[0,2]])
ans


/* error:
 
class Solution {
    
    class Node {
        var value: Int
        var next: [Node] = []
        init(_ value: Int) {
            self.value = value
        }
    }
    
    var cache: [Int: Node] = [:]
    var circle: [Int: Bool] = [:]
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        for prerequisite in prerequisites {
            let val1 = prerequisite[0], val2 = prerequisite[1]
            let node = cache[val1] ?? Node(val1),
            next = cache[val2] ?? Node(val2)
            node.next.append(next)
            cache[val1] = node
            cache[val2] = next
        }
        
        for i in 0..<numCourses {
            guard let node = cache[i] else {
                continue
            }
            if checkCircle(node) {
                return false
            }
        }
        
        return true
    }
    
    func checkCircle(_ node: Node) -> Bool {
        if let res = circle[node.value] {
            return res
        }
        var memory: [Int: Bool] = [:]
        var nodes = [node]
        while !nodes.isEmpty {
            var temp: [Node] = []
            for n in nodes {
                if memory[n.value] != nil {
                    return false
                }
                memory[n.value] = true
                temp.append(contentsOf: n.next)
            }
            nodes = temp
        }
        for k in memory.keys {
            circle[Int(k)] = false
        }
        return false
    }
}

let solution = Solution()
let ans = solution.canFinish(2, [[1,0],[0,1]])
ans
 
 */

//: [Next](@next)
