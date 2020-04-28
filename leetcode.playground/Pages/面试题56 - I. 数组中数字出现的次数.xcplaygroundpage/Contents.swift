//: [Previous](@previous)

/*
 
 面试题56 - I. 数组中数字出现的次数
 
 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

  

 示例 1：

 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 示例 2：

 输入：nums = [1,2,10,4,1,4,3,3]
 输出：[2,10] 或 [10,2]
  

 限制：

 2 <= nums <= 10000
 
 */

import Foundation

class Solution {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        return divide(nums)
    }
    
    func divide(_ nums:[Int]) -> [Int] {
        var xor: Int = 0, a = 0, b = 0, div = 1
        for n in nums {
            xor ^= n
        }
        while (xor & div) == 0  {
            div <<= 1
        }

        for n in nums {
            if div & n == 0 {
                a ^= n
            } else {
                b ^= n
            }
        }
        return [a, b]
    }
}

let solution = Solution()
let ans = solution.singleNumbers([6,2,3,3])

//: [Next](@next)
