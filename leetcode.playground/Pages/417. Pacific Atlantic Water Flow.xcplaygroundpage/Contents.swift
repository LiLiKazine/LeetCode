//: [Previous](@previous)

/*
 417. Pacific Atlantic Water Flow
 中等
 There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.

 The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).

 The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

 Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.

  

 Example 1:


 Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]
 Output: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
 Explanation: The following cells can flow to the Pacific and Atlantic oceans, as shown below:
 [0,4]: [0,4] -> Pacific Ocean
        [0,4] -> Atlantic Ocean
 [1,3]: [1,3] -> [0,3] -> Pacific Ocean
        [1,3] -> [1,4] -> Atlantic Ocean
 [1,4]: [1,4] -> [1,3] -> [0,3] -> Pacific Ocean
        [1,4] -> Atlantic Ocean
 [2,2]: [2,2] -> [1,2] -> [0,2] -> Pacific Ocean
        [2,2] -> [2,3] -> [2,4] -> Atlantic Ocean
 [3,0]: [3,0] -> Pacific Ocean
        [3,0] -> [4,0] -> Atlantic Ocean
 [3,1]: [3,1] -> [3,0] -> Pacific Ocean
        [3,1] -> [4,1] -> Atlantic Ocean
 [4,0]: [4,0] -> Pacific Ocean
        [4,0] -> Atlantic Ocean
 Note that there are other possible paths for these cells to flow to the Pacific and Atlantic oceans.
 Example 2:

 Input: heights = [[1]]
 Output: [[0,0]]
 Explanation: The water can flow from the only cell to the Pacific and Atlantic oceans.
  

 Constraints:

 m == heights.length
 n == heights[r].length
 1 <= m, n <= 200
 0 <= heights[r][c] <= 105
 
 */

import Foundation

class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        

        let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
        
        func isValid(_ x: Int, _ y: Int, _ height: Int, _ set: inout Set<[Int]>) -> Bool {
            if x < 0 || x >= heights.count || y < 0 || y >= heights[x].count {
                return false
            }
            if set.contains([x, y]) {
                return false
            }
            return heights[x][y] >= height
        }
        
        func dfs(_ x: Int, _ y: Int, _ set: inout Set<[Int]>) {
            set.insert([x, y])
            let height = heights[x][y]
            for direction in directions {
                let x = x + direction[0], y = y + direction[1]
                if isValid(x, y, height, &set) {
                    dfs(x, y, &set)
                }
            }
        }
        
        var pacific = Set<[Int]>()
        for i in 0..<heights.count {
            if !pacific.contains([i, 0]) {
                dfs(i, 0, &pacific)
            }
        }
        
        for j in 1..<heights[0].count {
            if !pacific.contains([0, j]) {
                dfs(0, j, &pacific)
            }
        }
        
        var atlantic = Set<[Int]>()
        for i in 0..<heights.count {
            let j = heights[i].count - 1
            if !atlantic.contains([i, j]) {
                dfs(i, j, &atlantic)
            }
        }
        
        for j in 0..<heights[0].count-1 {
            let i = heights.count - 1
            if !atlantic.contains([i, j]) {
                dfs(0, j, &atlantic)
            }
        }
        
        for land in pacific {
            if atlantic.contains(land) {
                ans.append(land)
            }
        }
//        print(pacific.sorted(by: arrange(_:_:)))
//        print(atlantic.sorted(by: arrange(_:_:)))
        ans.sort(by: arrange(_:_:))
        return ans
    }
    
    func arrange(_ arr1: [Int], _ arr2: [Int]) -> Bool {
        return arr1[0] == arr2[0] ? arr1[1] <= arr2[1] : arr1[0] < arr2[0]
    }
}

//: [Next](@next)
