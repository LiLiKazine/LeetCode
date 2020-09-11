//: [Previous](@previous)

/*
 
 216. Combination Sum III
 
 Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.

 Note:

 All numbers will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: k = 3, n = 7
 Output: [[1,2,4]]
 Example 2:

 Input: k = 3, n = 9
 Output: [[1,2,6], [1,3,5], [2,3,4]]
 
 */

class Solution {
    var candidates = [Int]()
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        
//        for i in 1...9 {
//            candidates.append(contentsOf: Array<Int>(repeating: i, count: k))
//        }
        candidates = Array(stride(from: 1, to: 10, by: 1))
        print(candidates)
        return recursive([], k, n, 0)
    }
    
    func recursive(_ heads: [Int], _ k: Int, _ n: Int, _ i: Int) -> [[Int]] {
        
        var ans = [[Int]]()
        
        for j in i..<candidates.count {
            if j-1>=i && candidates[j-1] == candidates[j] {
                continue
            }
            
            if k * candidates[j] > n || k == 0 {
                break
            }
            let dif = n - candidates[j]
            
            if dif > 0  {
                let tails = recursive(heads + [candidates[j]], k-1, dif, j + 1)
                ans.append(contentsOf: tails)
            }
            
            if dif == 0 {
                ans.append(heads+[candidates[j]])
                break
            }

        }
        
        return ans
    }
}

let solution = Solution()
let ans = solution.combinationSum3(3, 7)

/*
 
 func backTracing(_ heads: [Int], _ candidates: [Int], _ target: Int) -> [[Int]] {
     var result: [[Int]] = []
     for i in 0..<candidates.count {
         if i-1>=0 && candidates[i] == candidates[i-1] {
             continue
         }
         let val = candidates[i]
         let diff = target - val
         if diff == 0 {
             result.append(heads + [val])
             break
         }
         if diff < 0 {
             break
         }
         if i + 1 == candidates.count {
             break
         }
         let tails = backTracing(heads+[val], Array(candidates[i+1..<candidates.count]), diff)
         result.append(contentsOf: tails)
     }
     return result
 }
 
 */


//: [Next](@next)
