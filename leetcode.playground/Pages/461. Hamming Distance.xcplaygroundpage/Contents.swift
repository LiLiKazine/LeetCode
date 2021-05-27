//: [Previous](@previous)

/*
 
 461. Hamming Distance
 
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given two integers x and y, return the Hamming distance between them.

  

 Example 1:

 Input: x = 1, y = 4
 Output: 2
 Explanation:
 1   (0 0 0 1)
 4   (0 1 0 0)
        ↑   ↑
 The above arrows point to positions where the corresponding bits are different.
 Example 2:

 Input: x = 3, y = 1
 Output: 1
  

 Constraints:

 0 <= x, y <= 231 - 1
 
 */

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var xored = x ^ y, flag = 1, ans = 0
        repeat {
            if xored & flag > 0 {
                ans += 1
            }
            flag <<= 1
        } while flag > 0
        return ans
    }
}

let x = 3, y = 1
let solution = Solution()
let ans = solution.hammingDistance(x, y)
ans

//: [Next](@next)
