//: [Previous](@previous)

/*
 
 79. Word Search
 
 Given a 2D board and a word, find if the word exists in the grid.

 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.

 Example:

 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]

 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
  

 Constraints:

 board and word consists only of lowercase and uppercase English letters.
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 1 <= word.length <= 10^3
 通过次数90,862提交次数211,737
 
 */

/*
 
 class Solution {
     public boolean exist(char[][] board, String word) {
         int h = board.length, w = board[0].length;
         boolean[][] visited = new boolean[h][w];
         for (int i = 0; i < h; i++) {
             for (int j = 0; j < w; j++) {
                 boolean flag = check(board, visited, i, j, word, 0);
                 if (flag) {
                     return true;
                 }
             }
         }
         return false;
     }

     public boolean check(char[][] board, boolean[][] visited, int i, int j, String s, int k) {
         if (board[i][j] != s.charAt(k)) {
             return false;
         } else if (k == s.length() - 1) {
             return true;
         }
         visited[i][j] = true;
         int[][] directions = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
         boolean result = false;
         for (int[] dir : directions) {
             int newi = i + dir[0], newj = j + dir[1];
             if (newi >= 0 && newi < board.length && newj >= 0 && newj < board[0].length) {
                 if (!visited[newi][newj]) {
                     boolean flag = check(board, visited, newi, newj, s, k + 1);
                     if (flag) {
                         result = true;
                         break;
                     }
                 }
             }
         }
         visited[i][j] = false;
         return result;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/word-search/solution/dan-ci-sou-suo-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    
    var board = [[Character]]()
    var word = [Character]()
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        self.board = board
        self.word = Array(word)
        
        var ans: Bool = false
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                ans = ans || check([], 0, i, j)
                if ans {
                    break
                }
            }
        }
        
        return ans
    }
    
    // used = i * 1000 + j
    func check(_ used: [Int], _ k: Int, _ i: Int, _ j: Int) -> Bool {
        
        if !avaliable(used, i, j) || board[i][j] != word[k] {
            return false
        }
        
        if k == word.count - 1 {
            return true
        }
        
        var top = false, right = false, bottom = false, left = false
        
        let used = used + [i * 1000 + j], k = k + 1
        
        if i > 0 {
            left = check(used, k, i-1, j)
            if left {
                return true
            }
        }
        
        if i < board.count-1 {
            right = check(used, k, i+1, j)
            if right {
                return true
            }
        }
        
        if j > 0 {
            top = check(used, k, i, j-1)
            if top {
                return true
            }
        }
        
        if j < board[i].count-1 {
            bottom = check(used, k, i, j+1)
            if bottom {
                return true
            }
        }
        
        return false
    }
    
    func avaliable(_ seq: [Int], _ i: Int, _ j: Int) -> Bool {
        return !seq.contains(i * 1000 + j)
    }
}

let board: [[Character]] = [["F","Y","C","E","N","R","D"],
                            ["K","L","N","F","I","N","U"],
                            ["A","A","A","R","A","H","R"],
                            ["N","D","K","L","P","N","E"],
                            ["A","L","A","N","S","A","P"],
                            ["O","O","G","O","T","P","N"],
                            ["H","P","O","L","A","N","O"]]

let word = "poland"


let solution = Solution()
let ans = solution.exist(board, word)

//: [Next](@next)
