//: [Previous](@previous)

/*
 3007. Maximum Number That Sum of the Prices Is Less Than or Equal to K
 中等
 You are given an integer k and an integer x. The price of a number num is calculated by the count of
 set bits
  at positions x, 2x, 3x, etc., in its binary representation, starting from the least significant bit. The following table contains examples of how price is calculated.

 x    num    Binary Representation    Price
 1    13    000001101    3
 2    13    000001101    1
 2    233    011101001    3
 3    13    000001101    1
 3    362    101101010    2
 The accumulated price of num is the total price of numbers from 1 to num. num is considered cheap if its accumulated price is less than or equal to k.

 Return the greatest cheap number.

  

 Example 1:

 Input: k = 9, x = 1

 Output: 6

 Explanation:

 As shown in the table below, 6 is the greatest cheap number.

 x    num    Binary Representation    Price    Accumulated Price
 1    1    001    1    1
 1    2    010    1    2
 1    3    011    2    4
 1    4    100    1    5
 1    5    101    2    7
 1    6    110    2    9
 1    7    111    3    12
 Example 2:

 Input: k = 7, x = 2

 Output: 9

 Explanation:

 As shown in the table below, 9 is the greatest cheap number.

 x    num    Binary Representation    Price    Accumulated Price
 2    1    0001    0    0
 2    2    0010    1    1
 2    3    0011    1    2
 2    4    0100    0    2
 2    5    0101    0    2
 2    6    0110    1    3
 2    7    0111    1    4
 2    8    1000    1    5
 2    9    1001    1    6
 2    10    1010    2    8
  

 Constraints:

 1 <= k <= 1015
 1 <= x <= 8

 */

import Foundation

class Solution {
    
    struct Key : Hashable {
        let i: Int
        let isLimited: Bool
        let cnt: Int
    }

    func findMaximumNumber(_ k: Int, _ x: Int) -> Int {
        
        func countDigitOne(_ n: Int) -> Int {
            var cache = [Key : Int]()
            let len = Int.bitWidth - n.leadingZeroBitCount
            func dfs(_ i: Int, _ isLimited: Bool, _ cnt: Int) -> Int {
                if i == 0 {
                    return cnt
                }
                let key = Key(i: i, isLimited: isLimited, cnt: cnt)
                if let value = cache[key] {
                    return value
                }
                let up = isLimited ? n >> (i - 1) & 1 : 1
                var res = 0
                for j in 0...up {
                    let valid = (i % x == 0) && j == 1
                    res += dfs(i - 1, isLimited && j == up, cnt + (valid ? 1 : 0))
                }
                cache[key] = res
                return res
            }

            let res = dfs(len, true, 0)
            return res
        }
        
        var l = 0, r = (k + 1) << x
        while l + 1 < r {
            let mid = l + (r - l) / 2
            if countDigitOne(mid) <= k {
                l = mid
            } else {
                r = mid
            }
        }
        return l
    }
}

//: [Next](@next)
