//: [Previous](@previous)

/*
 2961. Double Modular Exponentiation
 中等
 You are given a 0-indexed 2D array variables where variables[i] = [ai, bi, ci, mi], and an integer target.

 An index i is good if the following formula holds:

 0 <= i < variables.length
 ((aibi % 10)ci) % mi == target
 Return an array consisting of good indices in any order.

 Example 1:

 Input: variables = [[2,3,3,10],[3,3,3,1],[6,1,1,4]], target = 2
 Output: [0,2]
 Explanation: For each index i in the variables array:
 1) For the index 0, variables[0] = [2,3,3,10], (23 % 10)3 % 10 = 2.
 2) For the index 1, variables[1] = [3,3,3,1], (33 % 10)3 % 1 = 0.
 3) For the index 2, variables[2] = [6,1,1,4], (61 % 10)1 % 4 = 2.
 Therefore we return [0,2] as the answer.
 Example 2:

 Input: variables = [[39,3,1000,1000]], target = 17
 Output: []
 Explanation: For each index i in the variables array:
 1) For the index 0, variables[0] = [39,3,1000,1000], (393 % 10)1000 % 1000 = 1.
 Therefore we return [] as the answer.
  

 Constraints:

 1 <= variables.length <= 100
 variables[i] == [ai, bi, ci, mi]
 1 <= ai, bi, ci, mi <= 103
 0 <= target <= 103
 
 */


import Foundation

class Solution {
    
    func powMod(_ x: Int, _ y: Int, _ mod: Int) -> Int {
        var x = x, y = y
        var res = 1
        while y > 0 {
            if y % 2 > 0 {
                res = res * x % mod
            }
            x = x * x % mod
            y /= 2
        }
        return res
    }
    func getGoodIndices(_ variables: [[Int]], _ target: Int) -> [Int] {
        
        var ans = [Int]()
        
        for (i, v) in variables.enumerated() {
            
            let res = powMod(powMod(v[0], v[1], 10), v[2], v[3])
            if res == target {
                ans.append(i)
            }
            
        }
        
        return ans

    }
}


//: [Next](@next)
