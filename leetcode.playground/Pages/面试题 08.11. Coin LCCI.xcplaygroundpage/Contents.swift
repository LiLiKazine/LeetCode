//: [Previous](@previous)

/*
 
 面试题 08.11. Coin LCCI
 
 Given an infinite number of quarters (25 cents), dimes (10 cents), nickels (5 cents), and pennies (1 cent), write code to calculate the number of ways of representing n cents. (The result may be large, so you should return it modulo 1000000007)

 Example1:

  Input: n = 5
  Output: 2
  Explanation: There are two ways:
 5=5
 5=1+1+1+1+1
 Example2:

  Input: n = 10
  Output: 4
  Explanation: There are four ways:
 10=10
 10=5+5
 10=5+1+1+1+1+1
 10=1+1+1+1+1+1+1+1+1+1
 Notes:

 You can assume:

 0 <= n <= 1000000
 
 */

import Foundation

class Solution {
    
    /*
     
     int waysToChange(int n) {
             vector<int> f(n + 1);
             f[0] = 1;
             for (int c = 0; c < 4; ++c) {
                 int coin = coins[c];
                 for (int i = coin; i <= n; ++i) {
                     f[i] = (f[i] + f[i - coin]) % mod;
                 }
             }
             return f[n];
         }

     */
    
    var record: [Key: Int] = [:]
    
    func waysToChange(_ n: Int) -> Int {
        let ans = dp(n)
        return ans
    }
    
    func dp(_ n: Int) -> Int {
        var record: [Int] = Array<Int>(repeating: 0, count: n+1)
        record[0] = 1
        for coin in [1, 5, 10, 25] {
            if coin > n {
                continue
            }
            for i in coin ... n {
                record[i] = (record[i-coin] + record[i]) % 1000000007
            }
        }
        return record[n]
    }
    
    func backTracing(_ n: Int, options: [Int]) -> Int {
        if let recorded = record[.init(n, options)] {
            return recorded
        }
        if n == 0 {
            return 1
        }
        var ans = 0, num = options.count
        for (i, val) in options.enumerated() {
            if n >= val {
                ans = (ans + backTracing(n-val, options: Array(options[i..<num]))) % 1000000007
            }
        }
        record[.init(n, options)] = ans
        return ans
    }
    
    struct Key: Hashable {
        var n: Int
        var options: [Int]
        init(_ n: Int, _ options: [Int]) {
            self.n = n
            self.options = options
        }
    }
}

let solution = Solution()
let ans = solution.waysToChange(900750)

//: [Next](@next)
