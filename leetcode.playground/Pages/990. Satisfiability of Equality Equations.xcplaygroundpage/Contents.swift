//: [Previous](@previous)

/*
 
 990. Satisfiability of Equality Equations
 
 Given an array equations of strings that represent relationships between variables, each string equations[i] has length 4 and takes one of two different forms: "a==b" or "a!=b".  Here, a and b are lowercase letters (not necessarily different) that represent one-letter variable names.

 Return true if and only if it is possible to assign integers to variable names so as to satisfy all the given equations.

  

 Example 1:

 Input: ["a==b","b!=a"]
 Output: false
 Explanation: If we assign say, a = 1 and b = 1, then the first equation is satisfied, but not the second.  There is no way to assign the variables to satisfy both equations.
 Example 2:

 Input: ["b==a","a==b"]
 Output: true
 Explanation: We could assign a = 1 and b = 1 to satisfy both equations.
 Example 3:

 Input: ["a==b","b==c","a==c"]
 Output: true
 Example 4:

 Input: ["a==b","b!=c","c==a"]
 Output: false
 Example 5:

 Input: ["c==c","b==d","x!=z"]
 Output: true
  

 Note:

 1 <= equations.length <= 500
 equations[i].length == 4
 equations[i][0] and equations[i][3] are lowercase letters
 equations[i][1] is either '=' or '!'
 equations[i][2] is '='
 
 */

import Foundation

class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {
        var equals = [[String]](), unequals = [[String]]()
        var indexs = [String: Int]()
        var n = 0
        for equation in equations {
            let equation = Array(equation).map { String($0) }
            let a = equation[0], b = equation[3]
            if indexs[a] == nil {
                indexs[a] = n
                n += 1
            }
            if indexs[b] == nil {
                indexs[b] = n
                n += 1
            }
            if equation[1] == "!" {
                unequals.append([a, b])
            } else {
                equals.append([a, b])
            }
        }
        
        var union = Array(0..<n)
        
        func connect(_ a: Int, b: Int) {
            union[a] = find(union[b])
        }
        
        func find(_ i: Int) -> Int {
            if i == union[i] {
                return i
            }
            union[i] = find(union[i])
            return union[i]
        }
        
        for equal in equals {
            connect(indexs[equal[0]]!, b: indexs[equal[1]]!)
        }
        
        for unequal in unequals {
            if find(indexs[unequal[0]]!) == find(indexs[unequal[1]]!) {
                return false
            }
        }
        
        return true
    }
}

let solution = Solution()
let equation = ["a==b","e==c","b==c","a!=e"]
let ans = solution.equationsPossible(equation)

//: [Next](@next)
