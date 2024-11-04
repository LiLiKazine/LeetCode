//: [Previous](@previous)

/*
 1648. Sell Diminishing-Valued Colored Balls
 中等
 You have an inventory of different colored balls, and there is a customer that wants orders balls of any color.

 The customer weirdly values the colored balls. Each colored ball's value is the number of balls of that color you currently have in your inventory. For example, if you own 6 yellow balls, the customer would pay 6 for the first yellow ball. After the transaction, there are only 5 yellow balls left, so the next yellow ball is then valued at 5 (i.e., the value of the balls decreases as you sell more to the customer).

 You are given an integer array, inventory, where inventory[i] represents the number of balls of the ith color that you initially own. You are also given an integer orders, which represents the total number of balls that the customer wants. You can sell the balls in any order.

 Return the maximum total value that you can attain after selling orders colored balls. As the answer may be too large, return it modulo 109 + 7.

  

 Example 1:


 Input: inventory = [2,5], orders = 4
 Output: 14
 Explanation: Sell the 1st color 1 time (2) and the 2nd color 3 times (5 + 4 + 3).
 The maximum total value is 2 + 5 + 4 + 3 = 14.
 Example 2:

 Input: inventory = [3,5], orders = 6
 Output: 19
 Explanation: Sell the 1st color 2 times (3 + 2) and the 2nd color 4 times (5 + 4 + 3 + 2).
 The maximum total value is 3 + 2 + 5 + 4 + 3 + 2 = 19.
  

 Constraints:

 1 <= inventory.length <= 105
 1 <= inventory[i] <= 109
 1 <= orders <= min(sum(inventory[i]), 109)
 */

import Foundation

class Solution {
    
    let modulo = 1000000000 + 7
    
    func maxProfit(_ inventory: [Int], _ orders: Int) -> Int {
        let inventory = inventory.sorted(by: >)
        var l = 0, r = inventory[0]
        
        func sum(_ h: Int, _ len: Int) -> Int {
            let l = h - len + 1
            return (l + h) * len / 2
        }
        
        while l <= r {
            let mid = l + (r - l) / 2
            let c = inventory.reduce(0) {
                $0 + max(0, $1 - mid)
            }
            if c > orders {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        let x = l
        var ans = 0, tot = 0
        for n in inventory {
            if n <= x { break }
            let len = n - x
            ans += sum(n, len) % modulo
            tot += len
        }
        if orders > tot {
            ans += (orders - tot) * x
        }
        return ans % modulo
    }
}

//: [Next](@next)
