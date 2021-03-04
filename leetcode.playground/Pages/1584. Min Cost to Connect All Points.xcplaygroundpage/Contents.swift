//: [Previous](@previous)

/*
 
 1584. Min Cost to Connect All Points
 
 You are given an array points representing integer coordinates of some points on a 2D-plane, where points[i] = [xi, yi].

 The cost of connecting two points [xi, yi] and [xj, yj] is the manhattan distance between them: |xi - xj| + |yi - yj|, where |val| denotes the absolute value of val.

 Return the minimum cost to make all points connected. All points are connected if there is exactly one simple path between any two points.

  

 Example 1:



 Input: points = [[0,0],[2,2],[3,10],[5,2],[7,0]]
 Output: 20
 Explanation:

 We can connect the points as shown above to get the minimum cost of 20.
 Notice that there is a unique path between every pair of points.
 Example 2:

 Input: points = [[3,12],[-2,5],[-4,1]]
 Output: 18
 Example 3:

 Input: points = [[0,0],[1,1],[1,0],[-1,1]]
 Output: 4
 Example 4:

 Input: points = [[-1000000,-1000000],[1000000,1000000]]
 Output: 4000000
 Example 5:

 Input: points = [[0,0]]
 Output: 0
  

 Constraints:

 1 <= points.length <= 1000
 -106 <= xi, yi <= 106
 All pairs (xi, yi) are distinct.
 
 */

/*
 
 class Solution {
 public:
     int minCostConnectPoints(vector<vector<int>>& points) {
         vector<int>dis(points.size(),INT_MAX);
         vector<bool>visit(points.size(),false);
         visit[0] = true;
         int start = 0, res = 0, edges = points.size() - 1;
         int nextPos, minDis;
         while(edges--) {
             minDis = INT_MAX;
             for(int i = 0; i < points.size(); ++i) {
                 if(!visit[i]) {
                     dis[i] = min(getDist(points[start], points[i]),dis[i]);
                     if(dis[i] < minDis) {
                         minDis = dis[i];
                         nextPos = i;
                     }
                 }
             }
             visit[nextPos] = true;
             start = nextPos;
             res += minDis;
         }
         return res;
     }

     inline int getDist(vector<int>& a, vector<int>& b) {
         return abs(a[0] - b[0]) + abs(a[1] - b[1]);
     }
 };
 
 */
class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var visited: [Bool] = Array(repeating: false, count: points.count),
            dis: [Int] = Array(repeating: Int.max, count: points.count),
            edges = points.count - 1,
            start = 0, nextPos = 0, minDis = 0, res = 0
        visited[0] = true
        while edges > 0 {
            minDis = Int.max
            for i in 0..<points.count {
                if visited[i] {
                    continue
                }
                dis[i] = min(abs(points[start][0] - points[i][0]) + abs(points[start][1] - points[i][1]), dis[i])
                if dis[i] < minDis {
                    minDis = dis[i]
                    nextPos = i
                }
            }
            visited[nextPos] = true
            start = nextPos
            res += minDis
            edges -= 1
        }
        return res
    }
}

/*
class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var edges: [[Int]] = [], ans = 0, connected = 0
        for i in 0..<points.count {
            for j in i+1..<points.count {
                let edge = abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])
                edges.append([edge, i, j])
            }
        }
        edges.sort { $0[0] < $1[0] }
        
        let union = Union(points.count)
        for edge in edges {
            if union.unit(edge[1], edge[2]) {
                ans += edge[0]
                connected += 1
            }
            if connected == points.count {
                break
            }
        }
        return ans
    }
    
    private class Union {
        private var union: [Int], size: [Int]
        
        init(_ n: Int) {
            union = Array(0..<n)
            size = Array(repeating: 1, count: n)
        }
        
        func find(_ i: Int) -> Int {
            if union[i] != i {
                union[i] = find(union[i])
            }
            return union[i]
        }
        
        func unit(_ i1: Int, _ i2: Int) -> Bool {
            let x = find(i1), y = find(i2)
            if x == y {
                return false
            }
            if size[x] > size[y] {
                union[y] = x
                size[x] += size[y]
            } else {
                union[x] = y
                size[y] += size[x]
            }
            
            return true
        }
    }
}
 */

let points = [[0,0],[1,1],[1,0],[-1,1]]
let solution = Solution()
let ans = solution.minCostConnectPoints(points)

//: [Next](@next)
