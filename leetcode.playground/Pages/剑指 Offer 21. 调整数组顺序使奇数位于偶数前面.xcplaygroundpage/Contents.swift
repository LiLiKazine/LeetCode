//: [Previous](@previous)

/*
 
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面
 
 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。

  

 示例：

 输入：nums = [1,2,3,4]
 输出：[1,3,2,4]
 注：[3,1,2,4] 也是正确的答案之一。
  

 提示：

 1 <= nums.length <= 50000
 1 <= nums[i] <= 10000
 通过次数92,260提交次数143,352
 
 */

class Solution {
    func exchange(_ nums: [Int]) -> [Int] {
        var nums = nums, i = 0, j = nums.count - 1
        while i < j {
            if nums[i] % 2 == 0 {
                while j >= i {
                    if nums[j] % 2 == 1 {
                        break
                    }
                    j -= 1
                }
                if i < j {
                    nums[i] += nums[j]
                    nums[j] = nums[i] - nums[j]
                    nums[i] -= nums[j]
                }
            }
            i += 1
        }
        
        return nums
    }
}

//let nums = [2,4,6]
let nums = [1,2,3,4]
let solution = Solution()
let ans = solution.exchange(nums)
ans

//: [Next](@next)
