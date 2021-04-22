//: [Previous](@previous)

/*
 
 363. Max Sum of Rectangle No Larger Than K
 
 Given an m x n matrix matrix and an integer k, return the max sum of a rectangle in the matrix such that its sum is no larger than k.

 It is guaranteed that there will be a rectangle with a sum no larger than k.

  

 Example 1:


 Input: matrix = [[1,0,1],[0,-2,3]], k = 2
 Output: 2
 Explanation: Because the sum of the blue rectangle [[0, 1], [-2, 3]] is 2, and 2 is the max number no larger than k (k = 2).
 Example 2:

 Input: matrix = [[2,2,-1]], k = 3
 Output: 3
  

 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -100 <= matrix[i][j] <= 100
 -105 <= k <= 105
  

 Follow up: What if the number of rows is much larger than the number of columns?
 
 */

/*
 
 class Solution {
 public:
     int maxSumSubmatrix(vector<vector<int>> &matrix, int k) {
         int ans = INT_MIN;
         int m = matrix.size(), n = matrix[0].size();
         for (int i = 0; i < m; ++i) { // 枚举上边界
             vector<int> sum(n);
             for (int j = i; j < m; ++j) { // 枚举下边界
                 for (int c = 0; c < n; ++c) {
                     sum[c] += matrix[j][c]; // 更新每列的元素和
                 }
                 set<int> sumSet{0};
                 int s = 0;
                 for (int v : sum) {
                     s += v;
                     auto lb = sumSet.lower_bound(s - k);
                     if (lb != sumSet.end()) {
                         ans = max(ans, s - *lb);
                     }
                     sumSet.insert(s);
                 }
             }
         }
         return ans;
     }
 };
 
 */

class Solution {
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        var ans = Int.min
        let m = matrix.count, n = matrix.first?.count ?? 0
        for i in 0..<m {
            var sum = Array(repeating: 0, count: n)
            for j in i..<m {
                for c in 0..<n {
                    sum[c] += matrix[j][c]
                }
                
                var set = Set<Int>()
                set.insert(0)
                var s = 0
                for val in sum {
                    s += val
                    for sv in set.sorted() {
                        if sv >= s - k {
                            ans = max(ans, s - sv)
                            break
                        }
                    }
                    set.insert(s)
                }
            }
        }
        return ans
    }
}
//3
//2 4 3
let matrix = [[5,-4,-3,4],[-3,-4,4,5],[5,1,5,-4]], k = 10
//let matrix = [[5,-4,-3,4],[-3,-4,4,5],[5,1,5,-4]], k = -2
//let matrix = [[2,2,-1]], k = 3
let solution = Solution()
let ans = solution.maxSumSubmatrix(matrix, k)
ans

//: [Next](@next)
