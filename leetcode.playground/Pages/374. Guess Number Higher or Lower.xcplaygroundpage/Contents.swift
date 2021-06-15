//: [Previous](@previous)

/*
 
 374. Guess Number Higher or Lower
 
 We are playing the Guess Game. The game is as follows:

 I pick a number from 1 to n. You have to guess which number I picked.

 Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

 You call a pre-defined API int guess(int num), which returns 3 possible results:

 -1: The number I picked is lower than your guess (i.e. pick < num).
 1: The number I picked is higher than your guess (i.e. pick > num).
 0: The number I picked is equal to your guess (i.e. pick == num).
 Return the number that I picked.

  

 Example 1:

 Input: n = 10, pick = 6
 Output: 6
 Example 2:

 Input: n = 1, pick = 1
 Output: 1
 Example 3:

 Input: n = 2, pick = 1
 Output: 1
 Example 4:

 Input: n = 2, pick = 2
 Output: 2
  

 Constraints:

 1 <= n <= 231 - 1
 1 <= pick <= n
 
 */

class GuessGame {
    func guess(_ n: Int) -> Int {
        return n - 6 == 0 ? 0 : (n - 6) / abs(n - 6)
    }
}

class Solution : GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var lo = 1, hi = n
        while lo < hi {
            let mid = lo + (hi - lo) / 2
            let res = guess(mid)
            if res == 0 {
                return mid
            } else if res < 0 {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
}

let solution = Solution()
let ans = solution.guessNumber(10)
ans

//: [Next](@next)
