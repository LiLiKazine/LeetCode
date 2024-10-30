//: [Previous](@previous)

/*
 233. Number of Digit One
 困难
 Given an integer n, count the total number of digit 1 appearing in all non-negative integers less than or equal to n.

  

 Example 1:

 Input: n = 13
 Output: 6
 Example 2:

 Input: n = 0
 Output: 0
  

 Constraints:

 0 <= n <= 109
 */

class Solution {
    
    struct Key : Hashable {
        let i: Int
        let isLimited: Bool
        let num: Int
    }
    func countDigitOne(_ n: Int) -> Int {
        let up = String(n).map { Int(String($0))! }
        let len = up.count
        
        var cache = [Key : Int]()
        
        func dfs(_ i: Int, _ isLimited: Bool, _ num: Int) -> Int {
            if len == i {
                return num
            }
            let key = Key(i: i, isLimited: isLimited, num: num)
            if let value = cache[key] {
                return value
            }
            var res = 0
            let top =  isLimited ? up[i] : 9
            
            for j in 0...top {
                res += dfs(i + 1, isLimited && j == top, num + (j == 1 ? 1 : 0))
            }
            cache[key] = res
            return res
        }
        
        let ans = dfs(0, true, 0)
        return ans
    }
}

//: [Next](@next)
