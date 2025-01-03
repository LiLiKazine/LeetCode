//: [Previous](@previous)

/*
 2517. Maximum Tastiness of Candy Basket
 中等
 You are given an array of positive integers price where price[i] denotes the price of the ith candy and a positive integer k.

 The store sells baskets of k distinct candies. The tastiness of a candy basket is the smallest absolute difference of the prices of any two candies in the basket.

 Return the maximum tastiness of a candy basket.

  

 Example 1:

 Input: price = [13,5,1,8,21,2], k = 3
 Output: 8
 Explanation: Choose the candies with the prices [13,5,21].
 The tastiness of the candy basket is: min(|13 - 5|, |13 - 21|, |5 - 21|) = min(8, 8, 16) = 8.
 It can be proven that 8 is the maximum tastiness that can be achieved.
 Example 2:

 Input: price = [1,3,1], k = 2
 Output: 2
 Explanation: Choose the candies with the prices [1,3].
 The tastiness of the candy basket is: min(|1 - 3|) = min(2) = 2.
 It can be proven that 2 is the maximum tastiness that can be achieved.
 Example 3:

 Input: price = [7,7,7,7], k = 2
 Output: 0
 Explanation: Choosing any two distinct candies from the candies we have will result in a tastiness of 0.
  

 Constraints:

 2 <= k <= price.length <= 105
 1 <= price[i] <= 109
 */

import Foundation

class Solution {
    
    func maximumTastiness(_ price: [Int], _ k: Int) -> Int {
        let price = price.sorted()
        var l = 0, r = price.last! - price.first! + 1
        
        func check(_ x: Int) -> Bool {
            var prev = price[0], cnt = 1
            for i in 1..<price.count {
                if price[i] - prev >= x {
                    prev = price[i]
                    cnt += 1
                }
                if cnt >= k {
                    return true
                }
            }
            return false
        }
        
        while l + 1 < r {
            let mid = l + (r - l) / 2
            if check(mid) {
                l = mid
            } else {
                r = mid
            }
        }
        return l
        
    }
}

//: [Next](@next)
