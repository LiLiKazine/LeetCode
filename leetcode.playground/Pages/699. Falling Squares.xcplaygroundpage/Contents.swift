//: [Previous](@previous)

/*
 699. Falling Squares
 困难
 There are several squares being dropped onto the X-axis of a 2D plane.

 You are given a 2D integer array positions where positions[i] = [lefti, sideLengthi] represents the ith square with a side length of sideLengthi that is dropped with its left edge aligned with X-coordinate lefti.

 Each square is dropped one at a time from a height above any landed squares. It then falls downward (negative Y direction) until it either lands on the top side of another square or on the X-axis. A square brushing the left/right side of another square does not count as landing on it. Once it lands, it freezes in place and cannot be moved.

 After each square is dropped, you must record the height of the current tallest stack of squares.

 Return an integer array ans where ans[i] represents the height described above after dropping the ith square.

  

 Example 1:


 Input: positions = [[1,2],[2,3],[6,1]]
 Output: [2,5,5]
 Explanation:
 After the first drop, the tallest stack is square 1 with a height of 2.
 After the second drop, the tallest stack is squares 1 and 2 with a height of 5.
 After the third drop, the tallest stack is still squares 1 and 2 with a height of 5.
 Thus, we return an answer of [2, 5, 5].
 Example 2:

 Input: positions = [[100,100],[200,100]]
 Output: [100,100]
 Explanation:
 After the first drop, the tallest stack is square 1 with a height of 100.
 After the second drop, the tallest stack is either square 1 or square 2, both with heights of 100.
 Thus, we return an answer of [100, 100].
 Note that square 2 only brushes the right side of square 1, which does not count as landing on it.
  

 Constraints:

 1 <= positions.length <= 1000
 1 <= lefti <= 108
 1 <= sideLengthi <= 106
 */

/*
 class Solution {
 public:
     vector<int> fallingSquares(vector<vector<int>>& positions) {
         int n = positions.size();
         vector<int> ret(n);
         map<int, int> heightMap;
         heightMap[0] = 0; // 初始时从 0 开始的所有点的堆叠高度都是 0
         for (int i = 0; i < n; i++) {
             int size = positions[i][1];
             int left = positions[i][0], right = positions[i][0] + positions[i][1] - 1;
             auto lp = heightMap.upper_bound(left), rp = heightMap.upper_bound(right);
             int rHeight = prev(rp)->second; // 记录 right + 1 对应的堆叠高度（如果 right + 1 不在 heightMap 中）

             // 更新第 i 个掉落的方块的堆叠高度
             int height = 0;
             for (auto p = prev(lp); p != rp; p++) {
                 height = max(height, p->second + size);
             }

             // 清除 heightMap 中位于 (left, right] 内的点
             heightMap.erase(lp, rp);

             heightMap[left] = height; // 更新 left 的变化
             if (rp == heightMap.end() || rp->first != right + 1) { // 如果 right + 1 不在 heightMap 中，更新 right + 1 的变化
                 heightMap[right + 1] = rHeight;
             }
             ret[i] = i > 0 ? max(ret[i - 1], height) : height;
         }
         return ret;
     }
 };

 */

import Foundation

class Solution {
    func fallingSquares(_ positions: [[Int]]) -> [Int] {
        return 0
    }
}

//: [Next](@next)
