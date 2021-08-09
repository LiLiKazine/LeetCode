//: [Previous](@previous)

/*
 
 313. Super Ugly Number
 
 A super ugly number is a positive integer whose prime factors are in the array primes.

 Given an integer n and an array of integers primes, return the nth super ugly number.

 The nth super ugly number is guaranteed to fit in a 32-bit signed integer.

  

 Example 1:

 Input: n = 12, primes = [2,7,13,19]
 Output: 32
 Explanation: [1,2,4,7,8,13,14,16,19,26,28,32] is the sequence of the first 12 super ugly numbers given primes = [2,7,13,19].
 Example 2:

 Input: n = 1, primes = [2,3,5]
 Output: 1
 Explanation: 1 has no prime factors, therefore all of its prime factors are in the array primes = [2,3,5].
  

 Constraints:

 1 <= n <= 106
 1 <= primes.length <= 100
 2 <= primes[i] <= 1000
 primes[i] is guaranteed to be a prime number.
 All the values of primes are unique and sorted in ascending order.
 
 */

class Solution {
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        let m = primes.count
        var dp = Array(repeating: 0, count: n + 1), pointers = Array(repeating: 1, count: m)
        dp[1] = 1
        if n < 2 {
            return dp[n]
        }
        for i in 2...n {
            var nums = Array(repeating: 0, count: m)
            var minNum = Int.max
            for j in 0..<m {
                nums[j] = dp[pointers[j]] * primes[j]
                minNum = min(minNum, nums[j])
            }
            dp[i] = minNum
            for j in 0..<m {
                if minNum == nums[j] {
                    pointers[j] += 1
                }
            }
        }
        return dp[n]
    }
}


//: [Next](@next)
