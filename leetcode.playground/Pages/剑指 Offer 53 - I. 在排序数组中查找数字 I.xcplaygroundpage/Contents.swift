//: [Previous](@previous)

/*
 
 剑指 Offer 53 - I. 在排序数组中查找数字 I
 统计一个数字在排序数组中出现的次数。

  

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: 2
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: 0
  

 限制：

 0 <= 数组长度 <= 50000

  

 注意：本题与主站 34 题相同（仅返回值不同）：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var count = 0
        for n in nums {
            if n > target {
                break
            }
            if n == target {
                count += 1
            }
        }
        return count
    }
}

//: [Next](@next)
