//: [Previous](@previous)

/*
 
 1582. Special Positions in a Binary Matrix
 
 Given a rows x cols matrix mat, where mat[i][j] is either 0 or 1, return the number of special positions in mat.

 A position (i,j) is called special if mat[i][j] == 1 and all other elements in row i and column j are 0 (rows and columns are 0-indexed).

  

 Example 1:

 Input: mat = [[1,0,0],
               [0,0,1],
               [1,0,0]]
 Output: 1
 Explanation: (1,2) is a special position because mat[1][2] == 1 and all other elements in row 1 and column 2 are 0.
 Example 2:

 Input: mat = [[1,0,0],
               [0,1,0],
               [0,0,1]]
 Output: 3
 Explanation: (0,0), (1,1) and (2,2) are special positions.
 Example 3:

 Input: mat = [[0,0,0,1],
               [1,0,0,0],
               [0,1,1,0],
               [0,0,0,0]]
 Output: 2
 Example 4:

 Input: mat = [[0,0,0,0,0],
               [1,0,0,0,0],
               [0,1,0,0,0],
               [0,0,1,0,0],
               [0,0,0,1,1]]
 Output: 3
  

 Constraints:

 rows == mat.length
 cols == mat[i].length
 1 <= rows, cols <= 100
 mat[i][j] is 0 or 1.
 
 */

/*
 
 class Solution {
 public:
     int numSpecial(vector<vector<int>>& mat) {
         int count = 0 ;
         int rows[100] = { 0 } , cols[100] = { 0 };
         for ( int i = 0 ; i < mat.size() ; i ++ )
         {
             for ( int j = 0 ; j < mat[i].size() ; j ++ )
             {
                 if ( mat[i][j] == 1 )
                 {
                     rows[i] ++ ;
                     cols[j] ++ ;
                 }
             }
         }

         for ( int i = 0 ; i < mat.size() ; i ++ )
         {
             for ( int j = 0 ; j < mat[i].size() ; j ++ )
             {
                 if ( mat[i][j] == 1 && rows[i] == 1 && cols[j] == 1)
                 {
                     count ++ ;
                 }
             }
         }
         return count ;
     }
 };

 作者：CodingTwoandahalfyearsTrainee
 链接：https://leetcode-cn.com/problems/special-positions-in-a-binary-matrix/solution/1582-er-jin-zhi-ju-zhen-zhong-de-te-shu-kjh7f/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func numSpecial(_ mat: [[Int]]) -> Int {
        var rows: [Int] = Array(repeating: 0, count: mat.count), cols = Array(repeating: 0, count: mat.first?.count ?? 0), ans = 0
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                rows[i] += mat[i][j]
                cols[j] += mat[i][j]
            }
        }
        
        for i in 0..<mat.count {
            for j in 0..<mat[i].count {
                if rows[i] == 1 && cols[j] == 1 && mat[i][j] == 1 {
                    ans += 1
                }
            }
        }
        return ans
    }
}

let mat = [[1,0,0],[0,1,0],[0,0,1]]
let solution = Solution()
let ans = solution.numSpecial(mat)
ans

//: [Next](@next)
