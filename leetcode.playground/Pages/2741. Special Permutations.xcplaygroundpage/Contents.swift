//: [Previous](@previous)

/*
 2741. Special Permutations
 中等
 You are given a 0-indexed integer array nums containing n distinct positive integers. A permutation of nums is called special if:

 For all indexes 0 <= i < n - 1, either nums[i] % nums[i+1] == 0 or nums[i+1] % nums[i] == 0.
 Return the total number of special permutations. As the answer could be large, return it modulo 109 + 7.

  

 Example 1:

 Input: nums = [2,3,6]
 Output: 2
 Explanation: [3,6,2] and [2,6,3] are the two special permutations of nums.
 Example 2:

 Input: nums = [1,4,3]
 Output: 2
 Explanation: [3,1,4] and [4,1,3] are the two special permutations of nums.
  

 Constraints:

 2 <= nums.length <= 14
 1 <= nums[i] <= 109
 
 */

import Foundation

class Solution {
    let modulo = 1000000000 + 7

    var memo = [Int: [Int: Int]]()
    var len = 0
    var nums = [Int]()

    func specialPerm(_ nums: [Int]) -> Int {
        len = nums.count
        self.nums = nums
        var state = 1 << len - 1
        
        var ans = 0
        for i in 0..<len {
            ans += dfs(state: state ^ (1 << i), i: i) % modulo
        }
        
        
        return ans % modulo
    }
    
    func dfs(state: Int, i: Int) -> Int {
        
        if state == 0 {
            return 1
        }
        if let ans = memo[state]?[i] {
            return ans
        }
        var ans = 0
        
        for j in 0..<len {
            if i == j { continue }
            if state >> j & 1 == 0 { continue }
            if nums[i] % nums[j] != 0 && nums[j] % nums[i] != 0 { continue }
            ans += dfs(state: state ^ (1 << j), i: j) % modulo
        }
        ans %= modulo
        if memo[state] == nil {
            memo[state] = [i: ans]
        } else {
            memo[state]?[i] = ans
        }
        return ans
    }
  
}

//: [Next](@next)
