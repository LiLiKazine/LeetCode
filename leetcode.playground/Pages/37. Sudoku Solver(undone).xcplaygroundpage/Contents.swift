//: [Previous](@previous)

/*
 37. Sudoku Solver
 
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 Empty cells are indicated by the character '.'.


 A sudoku puzzle...


 ...and its solution numbers marked in red.

 Note:

 The given board contain only digits 1-9 and the character '.'.
 You may assume that the given Sudoku puzzle will have a single unique solution.
 The given board size is always 9x9.
 
 */

/*
 
 前言
 我们可以考虑按照「行优先」的顺序依次枚举每一个空白格中填的数字，通过递归 + 回溯的方法枚举所有可能的填法。当递归到最后一个空白格后，如果仍然没有冲突，说明我们找到了答案；在递归的过程中，如果当前的空白格不能填下任何一个数字，那么就进行回溯。

 由于每个数字在同一行、同一列、同一个九宫格中只会出现一次，因此我们可以使用 \textit{line}[i]line[i]，\textit{column}[j]column[j]，\textit{block}[x][y]block[x][y] 分别表示第 ii 行，第 jj 列，第 (x, y)(x,y) 个九宫格中填写数字的情况。在下面给出的三种方法中，我们将会介绍两种不同的表示填写数字情况的方法。

 九宫格的范围为 0 \leq x \leq 20≤x≤2 以及 0 \leq y \leq 20≤y≤2。
 具体地，第 ii 行第 jj 列的格子位于第 (\lfloor i/3 \rfloor, \lfloor j/3 \rfloor)(⌊i/3⌋,⌊j/3⌋) 个九宫格中，其中 \lfloor u \rfloor⌊u⌋ 表示对 uu 向下取整。

 由于这些方法均以递归 + 回溯为基础，算法运行的时间（以及时间复杂度）很大程度取决于给定的输入数据，而我们很难找到一个非常精确的渐进紧界。因此这里只给出一个较为宽松的渐进复杂度上界 O(9^{9 \times 9})O(9
 9×9
  )，即最多有 9 \times 99×9 个空白格，每个格子可以填 [1, 9][1,9] 中的任意整数。

 方法一：递归
 思路

 最容易想到的方法是用一个数组记录每个数字是否出现。由于我们可以填写的数字范围为 [1, 9][1,9]，而数组的下标从 00 开始，因此在存储时，我们使用一个长度为 99 的布尔类型的数组，其中 ii 个元素的值为 \text{True}True，当且仅当数字 i+1i+1 出现过。例如我们用 \textit{line}[2][3] = \text{True}line[2][3]=True 表示数字 44 在第 22 行已经出现过，那么当我们在遍历到第 22 行的空白格时，就不能填入数字 44。

 算法

 我们首先对整个数独数组进行遍历，当我们遍历到第 ii 行第 jj 列的位置：

 如果该位置是一个空白格，那么我们将其加入一个用来存储空白格位置的列表中，方便后续的递归操作；

 如果该位置是一个数字 xx，那么我们需要将 \textit{line}[i][x-1]line[i][x−1]，\textit{column}[j][x-1]column[j][x−1] 以及 \textit{block}[\lfloor i/3 \rfloor][\lfloor j/3 \rfloor][x-1]block[⌊i/3⌋][⌊j/3⌋][x−1] 均置为 \text{True}True。

 当我们结束了遍历过程之后，就可以开始递归枚举。当递归到第 ii 行第 jj 列的位置时，我们枚举填入的数字 xx。根据题目的要求，数字 xx 不能和当前行、列、九宫格中已经填入的数字相同，因此 \textit{line}[i][x-1]line[i][x−1]，\textit{column}[j][x-1]column[j][x−1] 以及 \textit{block}[\lfloor i/3 \rfloor][\lfloor j/3 \rfloor][x-1]block[⌊i/3⌋][⌊j/3⌋][x−1] 必须均为 \text{False}False。

 当我们填入了数字 xx 之后，我们要将上述的三个值都置为 \text{True}True，并且继续对下一个空白格位置进行递归。在回溯到当前递归层时，我们还要将上述的三个值重新置为 \text{False}False。

 代码

 C++JavaPython3GolangC

 class Solution {
 private:
     bool line[9][9];
     bool column[9][9];
     bool block[3][3][9];
     bool valid;
     vector<pair<int, int>> spaces;

 public:
     void dfs(vector<vector<char>>& board, int pos) {
         if (pos == spaces.size()) {
             valid = true;
             return;
         }

         auto [i, j] = spaces[pos];
         for (int digit = 0; digit < 9 && !valid; ++digit) {
             if (!line[i][digit] && !column[j][digit] && !block[i / 3][j / 3][digit]) {
                 line[i][digit] = column[j][digit] = block[i / 3][j / 3][digit] = true;
                 board[i][j] = digit + '0' + 1;
                 dfs(board, pos + 1);
                 line[i][digit] = column[j][digit] = block[i / 3][j / 3][digit] = false;
             }
         }
     }

     void solveSudoku(vector<vector<char>>& board) {
         memset(line, false, sizeof(line));
         memset(column, false, sizeof(column));
         memset(block, false, sizeof(block));
         valid = false;

         for (int i = 0; i < 9; ++i) {
             for (int j = 0; j < 9; ++j) {
                 if (board[i][j] == '.') {
                     spaces.emplace_back(i, j);
                 }
                 else {
                     int digit = board[i][j] - '0' - 1;
                     line[i][digit] = column[j][digit] = block[i / 3][j / 3][digit] = true;
                 }
             }
         }

         dfs(board, 0);
     }
 };
 方法二：位运算优化
 思路与算法

 在方法一中，我们使用了长度为 99 的数组表示每个数字是否出现过。我们同样也可以借助位运算，仅使用一个整数表示每个数字是否出现过。

 具体地，数 bb 的二进制表示的第 ii 位（从低到高，最低位为第 00 位）为 11，当且仅当数字 i+1i+1 已经出现过。例如当 bb 的二进制表示为 (011000100)_2(011000100)
 2
 ​    
   时，就表示数字 33，77，88 已经出现过。

 位运算有一些基础的使用技巧。下面列举了所有在代码中使用到的技巧：

 对于第 ii 行第 jj 列的位置，\textit{line}[i] ~|~ \textit{column}[j] ~|~ \textit{block}[\lfloor i/3 \rfloor][\lfloor j/3 \rfloor]line[i] ∣ column[j] ∣ block[⌊i/3⌋][⌊j/3⌋] 中第 kk 位为 11，表示该位置不能填入数字 k+1k+1（因为已经出现过），其中 |∣ 表示按位或运算。如果我们对这个值进行 \sim∼ 按位取反运算，那么第 kk 位为 11 就表示该位置可以填入数字 k+1k+1，我们就可以通过寻找 11 来进行枚举。由于在进行按位取反运算后，这个数的高位也全部变成了 11，而这是我们不应当枚举到的，因此我们需要将这个数和 (111111111)_2 = (\text{1FF})_{16}(111111111)
 2
 ​    
  =(1FF)
 16
 ​    
   进行按位与运算 \&&，将所有无关的位置为 00；

 我们可以使用按位异或运算 \wedge∧，将第 ii 位从 00 变为 11，或从 11 变为 00。具体地，与数 1 << i1<<i 进行按位异或运算即可，其中 <<<< 表示左移运算；

 我们可以用 b ~\&~ (-b)b & (−b) 得到 bb 二进制表示中最低位的 11，这是因为 (-b)(−b) 在计算机中以补码的形式存储，它等于 \sim b + 1∼b+1。bb 如果和 \sim b∼b 进行按位与运算，那么会得到 00，但是当 \sim b∼b 增加 11 之后，最低位的连续的 11 都变为 00，而最低位的 00 变为 11，对应到 bb 中即为最低位的 11，因此当 bb 和 \sim b + 1∼b+1 进行按位与运算时，只有最低位的 11 会被保留；

 当我们得到这个最低位的 11 时，我们可以通过一些语言自带的函数得到这个最低位的 11 究竟是第几位（即 ii 值），具体可以参考下面的代码；

 我们可以用 bb 和最低位的 11 进行按位异或运算，就可以将其从 bb 中去除，这样就可以枚举下一个 11。同样地，我们也可以用 bb 和 b-1b−1 进行按位与运算达到相同的效果，读者可以自行尝试推导。

 实际上，方法二中整体的递归 + 回溯的框架与方法一是一致的。不同的仅仅是我们将一个数组「压缩」成了一个数而已。

 代码

 C++JavaPython3GolangC

 class Solution {
 private:
     int line[9];
     int column[9];
     int block[3][3];
     bool valid;
     vector<pair<int, int>> spaces;

 public:
     void flip(int i, int j, int digit) {
         line[i] ^= (1 << digit);
         column[j] ^= (1 << digit);
         block[i / 3][j / 3] ^= (1 << digit);
     }

     void dfs(vector<vector<char>>& board, int pos) {
         if (pos == spaces.size()) {
             valid = true;
             return;
         }

         auto [i, j] = spaces[pos];
         int mask = ~(line[i] | column[j] | block[i / 3][j / 3]) & 0x1ff;
         for (; mask && !valid; mask &= (mask - 1)) {
             int digitMask = mask & (-mask);
             int digit = __builtin_ctz(digitMask);
             flip(i, j, digit);
             board[i][j] = digit + '0' + 1;
             dfs(board, pos + 1);
             flip(i, j, digit);
         }
     }

     void solveSudoku(vector<vector<char>>& board) {
         memset(line, 0, sizeof(line));
         memset(column, 0, sizeof(column));
         memset(block, 0, sizeof(block));
         valid = false;

         for (int i = 0; i < 9; ++i) {
             for (int j = 0; j < 9; ++j) {
                 if (board[i][j] == '.') {
                     spaces.emplace_back(i, j);
                 }
                 else {
                     int digit = board[i][j] - '0' - 1;
                     flip(i, j, digit);
                 }
             }
         }

         dfs(board, 0);
     }
 };
 方法三：枚举优化
 思路与算法

 我们可以顺着方法二的思路继续优化下去：

 如果一个空白格只有唯一的数可以填入，也就是其对应的 bb 值和 b-1b−1 进行按位与运算后得到 00（即 bb 中只有一个二进制位为 11）。此时，我们就可以确定这个空白格填入的数，而不用等到递归时再去处理它。
 这样一来，我们可以不断地对整个数独进行遍历，将可以唯一确定的空白格全部填入对应的数。随后我们再使用与方法二相同的方法对剩余无法唯一确定的空白格进行递归 + 回溯。

 代码

 C++JavaPython3GolangC

 class Solution {
 private:
     int line[9];
     int column[9];
     int block[3][3];
     bool valid;
     vector<pair<int, int>> spaces;

 public:
     void flip(int i, int j, int digit) {
         line[i] ^= (1 << digit);
         column[j] ^= (1 << digit);
         block[i / 3][j / 3] ^= (1 << digit);
     }

     void dfs(vector<vector<char>>& board, int pos) {
         if (pos == spaces.size()) {
             valid = true;
             return;
         }

         auto [i, j] = spaces[pos];
         int mask = ~(line[i] | column[j] | block[i / 3][j / 3]) & 0x1ff;
         for (; mask && !valid; mask &= (mask - 1)) {
             int digitMask = mask & (-mask);
             int digit = __builtin_ctz(digitMask);
             flip(i, j, digit);
             board[i][j] = digit + '0' + 1;
             dfs(board, pos + 1);
             flip(i, j, digit);
         }
     }

     void solveSudoku(vector<vector<char>>& board) {
         memset(line, 0, sizeof(line));
         memset(column, 0, sizeof(column));
         memset(block, 0, sizeof(block));
         valid = false;

         for (int i = 0; i < 9; ++i) {
             for (int j = 0; j < 9; ++j) {
                 if (board[i][j] != '.') {
                     int digit = board[i][j] - '0' - 1;
                     flip(i, j, digit);
                 }
             }
         }

         while (true) {
             int modified = false;
             for (int i = 0; i < 9; ++i) {
                 for (int j = 0; j < 9; ++j) {
                     if (board[i][j] == '.') {
                         int mask = ~(line[i] | column[j] | block[i / 3][j / 3]) & 0x1ff;
                         if (!(mask & (mask - 1))) {
                             int digit = __builtin_ctz(mask);
                             flip(i, j, digit);
                             board[i][j] = digit + '0' + 1;
                             modified = true;
                         }
                     }
                 }
             }
             if (!modified) {
                 break;
             }
         }

         for (int i = 0; i < 9; ++i) {
             for (int j = 0; j < 9; ++j) {
                 if (board[i][j] == '.') {
                     spaces.emplace_back(i, j);
                 }
             }
         }

         dfs(board, 0);
     }
 };
 下一篇：【解数独】回溯 + 状态压缩（使用 bitset）


 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/sudoku-solver/solution/jie-shu-du-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

import Foundation

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                let nums = avaliable(i, j, board)
                for i in nums {
                    
                }
            }
        }
    }
    
    
    
    func avaliable(_ x: Int, _ y: Int, _ board: [[Character]]) -> [Character] {
        var nums = [Character]("123456789")
        for i in 0..<9 {
            nums.removeAll(where: { $0 == board[i][y] })
            nums.removeAll(where: { $0 == board[x][i] })
        }
        let sec = y/3*3 + x/3%3
        let sx = sec % 3 * 3
        let sy = sec / 3 * 3
        for i in sx..<sx+3 {
            for j in sy..<sy+3 {
                nums.removeAll(where: { $0 == board[i][j] })
            }
        }
        return nums
    }
}

//: [Next](@next)
