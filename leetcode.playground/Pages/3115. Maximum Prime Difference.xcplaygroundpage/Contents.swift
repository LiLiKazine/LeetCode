//: [Previous](@previous)

/*
 3115. Maximum Prime Difference
 中等
 You are given an integer array nums.

 Return an integer that is the maximum distance between the indices of two (not necessarily different) prime numbers in nums.

  

 Example 1:

 Input: nums = [4,2,9,5,3]

 Output: 3

 Explanation: nums[1], nums[3], and nums[4] are prime. So the answer is |4 - 1| = 3.

 Example 2:

 Input: nums = [4,8,2,8]

 Output: 0

 Explanation: nums[2] is prime. Because there is just one prime number, the answer is |2 - 2| = 0.

  

 Constraints:

 1 <= nums.length <= 3 * 105
 1 <= nums[i] <= 100
 The input is generated such that the number of prime numbers in the nums is at least one.
 
 */

import Foundation

class Solution {
    func maximumPrimeDifference(_ nums: [Int]) -> Int {
        
        var primes = Set(arrayLiteral: 2, 3, 5, 7, 11,
                          13, 17, 19, 23, 29,
                          31, 37, 41, 43, 47,
                          53, 59, 61, 67, 71,
                          73, 79, 83, 89, 97)
        var lo = 0, hi = nums.count - 1
        func isPrime(_ n: Int) -> Bool {
            return primes.contains(n)
        }
        while hi > lo {
            if isPrime(nums[hi]) {
                break
            }
            hi -= 1
        }
        
        while hi > lo {
            if isPrime(nums[lo]) {
                break
            }
            lo += 1
        }
        
        return hi - lo
    }
    
}

//: [Next](@next)
