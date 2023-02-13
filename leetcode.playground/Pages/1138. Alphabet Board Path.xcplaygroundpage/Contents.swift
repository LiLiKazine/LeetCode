//: [Previous](@previous)

/*
 
 1138. Alphabet Board Path
 
 On an alphabet board, we start at position (0, 0), corresponding to character board[0][0].

 Here, board = ["abcde", "fghij", "klmno", "pqrst", "uvwxy", "z"], as shown in the diagram below.



 We may make the following moves:

 'U' moves our position up one row, if the position exists on the board;
 'D' moves our position down one row, if the position exists on the board;
 'L' moves our position left one column, if the position exists on the board;
 'R' moves our position right one column, if the position exists on the board;
 '!' adds the character board[r][c] at our current position (r, c) to the answer.
 (Here, the only positions that exist on the board are positions with letters on them.)

 Return a sequence of moves that makes our answer equal to target in the minimum number of moves.  You may return any path that does so.

  

 Example 1:

 Input: target = "leet"
 Output: "DDR!UURRR!!DDD!"
 Example 2:

 Input: target = "code"
 Output: "RR!DDRR!UUL!R!"
  

 Constraints:

 1 <= target.length <= 100
 target consists only of English lowercase letters.
 
 */

class Solution {
    func alphabetBoardPath(_ target: String) -> String {
//        let board = [Array("abcde"), Array("fghij"), Array("klmno"), Array("pqrst"), Array("uvwxy"), Array("z")]
        //a = 97 z= 122
        let target = Array(target)
        var ans: String = ""
        for i in 0..<target.count {
            let n = Int(target[i].asciiValue!) - 97
            let r = n / 5, c = n % 5
            if i == 0 {
                ans.append(moves(from: [0, 0], to: [r, c]))
            } else {
                let old = Int(target[i-1].asciiValue!) - 97
                ans.append(moves(from: [old / 5, old % 5], to: [r, c]))
            }
        }
        
        return ans
    }
    
    func moves(from source: [Int], to dest: [Int]) -> String {
        let x = dest[1] - source[1]
        let y = dest[0] - source[0]
//        print(source, dest, x, y)
        var ans = ""
        if y > 0 && x < 0 {
            ans += Array(repeating: "L", count: -x)
            ans += Array(repeating: "D", count: y)
            ans += "!"
        } else if y < 0 && x > 0 {
            ans += Array(repeating: "U", count: -y)
            ans += Array(repeating: "R", count: x)
            ans += "!"
        } else if y >= 0 && x >= 0 {
            ans += Array(repeating: "D", count: y)
            ans += Array(repeating: "R", count: x)
            ans += "!"
        } else if y <= 0 && x <= 0 {
            ans += Array(repeating: "U", count: -y)
            ans += Array(repeating: "L", count: -x)
            ans += "!"
        }
        
        return ans
    }
}

//"abcde"
//"fghij"
//"klmno"
//"pqrst"
//"uvwxy"
//"z"

let target = "zdz"
//let target = "code"
//let target = "leet"
let solution = Solution()
let ans = solution.alphabetBoardPath(target)
print(ans)

//: [Next](@next)
