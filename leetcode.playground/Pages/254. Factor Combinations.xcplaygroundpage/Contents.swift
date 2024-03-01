//: [Previous](@previous)

/*
 254. Factor Combinations
 中等
 Numbers can be regarded as the product of their factors.

 For example, 8 = 2 x 2 x 2 = 2 x 4.
 Given an integer n, return all possible combinations of its factors. You may return the answer in any order.

 Note that the factors should be in the range [2, n - 1].

  

 Example 1:

 Input: n = 1
 Output: []
 Example 2:

 Input: n = 12
 Output: [[2,6],[3,4],[2,2,3]]
 Example 3:

 Input: n = 37
 Output: []
  

 Constraints:

 1 <= n <= 107
 
 */

import Foundation

class Solution {
    
    var factorList = [[Int]]()
    var temp = [Int]()
    
    func getFactors(_ n: Int) -> [[Int]] {
        find(n, 2)
        return factorList
    }
    
    func find(_ n: Int, _ start: Int) {
        let size = temp.count
        if n == 1 {
            if size > 1 {
                factorList.append(temp)
            }
        } else {
            let sqrt = Int(Double(n).squareRoot())
            if sqrt >= start {
                for i in start...sqrt {
                    if n % i == 0 {
                        temp.append(i)
                        find(n / i, i)
                        temp.remove(at: size)
                    }
                }
            }
            temp.append(n)
            find(1, n)
            temp.remove(at: size)
        }
    }
}

//: [Next](@next)
