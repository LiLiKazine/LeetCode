//: [Previous](@previous)

/*
 
 399. Evaluate Division
 
 You are given an array of variable pairs equations and an array of real numbers values, where equations[i] = [Ai, Bi] and values[i] represent the equation Ai / Bi = values[i]. Each Ai or Bi is a string that represents a single variable.

 You are also given some queries, where queries[j] = [Cj, Dj] represents the jth query where you must find the answer for Cj / Dj = ?.

 Return the answers to all queries. If a single answer cannot be determined, return -1.0.

 Note: The input is always valid. You may assume that evaluating the queries will not result in division by zero and that there is no contradiction.

  

 Example 1:

 Input: equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
 Output: [6.00000,0.50000,-1.00000,1.00000,-1.00000]
 Explanation:
 Given: a / b = 2.0, b / c = 3.0
 queries are: a / c = ?, b / a = ?, a / e = ?, a / a = ?, x / x = ?
 return: [6.0, 0.5, -1.0, 1.0, -1.0 ]
 Example 2:

 Input: equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
 Output: [3.75000,0.40000,5.00000,0.20000]
 Example 3:

 Input: equations = [["a","b"]], values = [0.5], queries = [["a","b"],["b","a"],["a","c"],["x","y"]]
 Output: [0.50000,2.00000,-1.00000,-1.00000]
  

 Constraints:

 1 <= equations.length <= 20
 equations[i].length == 2
 1 <= Ai.length, Bi.length <= 5
 values.length == equations.length
 0.0 < values[i] <= 20.0
 1 <= queries.length <= 20
 queries[i].length == 2
 1 <= Cj.length, Dj.length <= 5
 Ai, Bi, Cj, Dj consist of lower case English letters and digits.
 
 */

class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var cache: [String: [String: Double]] = [:]
        for (index, pair) in equations.enumerated() {
            let a = pair[0], b = pair[1]
            if cache[a] == nil {
                cache[a] = [a: 1, b: values[index]]
            } else {
                cache[a]![a] = 1
                cache[a]![b] = values[index]
            }
            if cache[b] == nil {
                cache[b] = [b: 1, a: (1 / values[index])]
            } else {
                cache[b]![b] = 1
                cache[b]![a] = (1 / values[index])
            }
        }
        var ans: [Double] = []
        for pair in queries {
            let res = search(pair[0], pair[1], cache, 1)
            ans.append(res)
        }
        return ans
    }
    
    func search(_ divide: String, _ divider: String, _ route: [String: [String: Double]], _ multiplier: Double) -> Double {
        
        guard let dict = route[divide] else {
            return -1
        }
        if let res = dict[divider] {
            return res * multiplier
        }
        var newRoute = route
        newRoute.removeValue(forKey: divide)
        for key in dict.keys {
            let ans = search(key, divider, newRoute, multiplier * dict[key]!)
            if ans != -1 {
                return ans
            }
        }
        return -1
    }
}

let equations = [["a","b"],["b","c"]],
values = [2.0,3.0],
queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
//let equations = [["a","b"],["b","c"],["bc","cd"]], values = [1.5,2.5,5.0], queries = [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]
//let equations = [["a","b"],["b","c"]], values = [2.0,3.0], queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
let solution = Solution()
let ans = solution.calcEquation(equations, values, queries)
ans

//: [Next](@next)
