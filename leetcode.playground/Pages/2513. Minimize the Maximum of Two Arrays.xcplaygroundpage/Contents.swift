//: [Previous](@previous)

/*
 2513. Minimize the Maximum of Two Arrays
 中等
 We have two arrays arr1 and arr2 which are initially empty. You need to add positive integers to them such that they satisfy all the following conditions:

 arr1 contains uniqueCnt1 distinct positive integers, each of which is not divisible by divisor1.
 arr2 contains uniqueCnt2 distinct positive integers, each of which is not divisible by divisor2.
 No integer is present in both arr1 and arr2.
 Given divisor1, divisor2, uniqueCnt1, and uniqueCnt2, return the minimum possible maximum integer that can be present in either array.

  

 Example 1:

 Input: divisor1 = 2, divisor2 = 7, uniqueCnt1 = 1, uniqueCnt2 = 3
 Output: 4
 Explanation:
 We can distribute the first 4 natural numbers into arr1 and arr2.
 arr1 = [1] and arr2 = [2,3,4].
 We can see that both arrays satisfy all the conditions.
 Since the maximum value is 4, we return it.
 Example 2:

 Input: divisor1 = 3, divisor2 = 5, uniqueCnt1 = 2, uniqueCnt2 = 1
 Output: 3
 Explanation:
 Here arr1 = [1,2], and arr2 = [3] satisfy all conditions.
 Since the maximum value is 3, we return it.
 Example 3:

 Input: divisor1 = 2, divisor2 = 4, uniqueCnt1 = 8, uniqueCnt2 = 2
 Output: 15
 Explanation:
 Here, the final possible arrays can be arr1 = [1,3,5,7,9,11,13,15], and arr2 = [2,6].
 It can be shown that it is not possible to obtain a lower maximum satisfying all conditions.
  

 Constraints:

 2 <= divisor1, divisor2 <= 105
 1 <= uniqueCnt1, uniqueCnt2 < 109
 2 <= uniqueCnt1 + uniqueCnt2 <= 109
 */

import Foundation

class Solution {
    func minimizeSet(_ divisor1: Int, _ divisor2: Int, _ uniqueCnt1: Int, _ uniqueCnt2: Int) -> Int {
        let lcm = lcm(a: divisor1, b: divisor2)
        func check(_ x: Int) -> Bool {
            let left = max(0, uniqueCnt1 - x / divisor2 + x / lcm)
            let right = max(0, uniqueCnt2 - x / divisor1 + x / lcm)
            let common = x - x / divisor1 - x / divisor2 + x / lcm
            return common >= left + right
        }
        
        var l = 1, r = 1000000000 * 2 - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if check(mid) {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}

// GCD of two numbers:
func gcd(_ a: Int, _ b: Int) -> Int {
    var (a, b) = (a, b)
    while b != 0 {
        (a, b) = (b, a % b)
    }
    return abs(a)
}

// GCD of a vector of numbers:
func gcd(_ vector: [Int]) -> Int {
    return vector.reduce(0, gcd)
}

// LCM of two numbers:
func lcm(a: Int, b: Int) -> Int {
    return (a / gcd(a, b)) * b
}

// LCM of a vector of numbers:
func lcm(_ vector : [Int]) -> Int {
    return vector.reduce(1, lcm)
}

//: [Next](@next)
