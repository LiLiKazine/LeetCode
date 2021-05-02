//: [Previous](@previous)

/*
 
 7. Reverse Integer
 
 Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

 Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

  

 Example 1:

 Input: x = 123
 Output: 321
 Example 2:

 Input: x = -123
 Output: -321
 Example 3:

 Input: x = 120
 Output: 21
 Example 4:

 Input: x = 0
 Output: 0
  

 Constraints:

 -2^31 <= x <= 2^31 - 1
 
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        guard x != 0 else {
            return 0
        }
        var x = x, stack: [Int] = [], ans = 0
        while x != 0 {
            stack.append(x % 10)
            x /= 10
        }
        while !stack.isEmpty {
            let val = stack.removeFirst()
            print(val)
            if (Int(Int32.max) - val) / 10 >= ans && (Int(Int32.min) - val) / 10 <= ans {
                ans = ans * 10 + val
            } else {
                return 0
            }
        }
        
        return ans
    }
}

let x = -123
let solution = Solution()
let ans = solution.reverse(x)
ans

//: [Next](@next)
