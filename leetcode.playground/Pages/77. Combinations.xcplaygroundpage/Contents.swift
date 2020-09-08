//: [Previous](@previous)
/*
 
 77. Combinations
 
 Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

 You may return the answer in any order.

  

 Example 1:

 Input: n = 4, k = 2
 Output:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 Example 2:

 Input: n = 1, k = 1
 Output: [[1]]
  

 Constraints:

 1 <= n <= 20
 1 <= k <= n
 
 */


class Solution {
    
    var temp: [Int] = []
    var ans: [[Int]] = []
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        
        dfs(1, n, k)
        
        return ans
    }
    
    func dfs(_ cur: Int, _ n: Int, _ k: Int) {
        
        if temp.count + n - cur + 1 < k {
            return
        }
        
        if temp.count == k {
            ans.append(temp)
            return
        }
        
        temp.append(cur)
        dfs(cur+1, n, k)
        
        temp.removeLast()
        
        dfs(cur+1, n, k)
        
    }
    
    
//    func combine(_ n: Int, _ k: Int) -> [[Int]] {
//        if k == 1 {
//            let arr = Array(stride(from: 1, to: n+1, by: 1))
//            let ans: [[Int]] = arr.reduce([]) { (res, i) -> [[Int]] in
//                return res + [[i]]
//            }
//            return ans
//        }
//        let subArr = combine(n, k-1);
//        let ans:[[Int]] = subArr.reduce([]) { (res, arr) -> [[Int]] in
//            var temp: [[Int]] = []
//            for i in 1...n {
//                if !arr.contains(i) {
//                    temp.append((arr+[i]).sorted())
//                }
//            }
//            return res + temp
//        }
//        return Array(Set(ans))
//    }
}

let solution = Solution()
let ans = solution.combine(4, 2)
ans

//: [Next](@next)
