//: [Previous](@previous)

/*
 
 343. Integer Break
 
 Given a positive integer n, break it into the sum of at least two positive integers and maximize the product of those integers. Return the maximum product you can get.

 Example 1:

 Input: 2
 Output: 1
 Explanation: 2 = 1 + 1, 1 × 1 = 1.
 Example 2:

 Input: 10
 Output: 36
 Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.
 Note: You may assume that n is not less than 2 and not larger than 58.
 
 */

class Solution {
    func integerBreak(_ n: Int) -> Int {
        var ans = 0
        for i in 2...n {
            let arr = split(n, num: i)
            let res = arr.reduce(1, *)
            ans = max(ans, res)
        }
        return ans
    }
    
    func split(_ n: Int, num: Int) -> [Int] {
        let avrg = n / num, reminder = n % num
        if reminder == 0 {
            return Array<Int>(repeating: avrg, count: num)
        }
        let big = Array(repeating: avrg + 1, count: reminder)
        let small = Array(repeating: avrg, count: num-reminder)
        return big + small
    }
}

let solution = Solution()
let ans = solution.integerBreak(2)
ans

//: [Next](@next)
