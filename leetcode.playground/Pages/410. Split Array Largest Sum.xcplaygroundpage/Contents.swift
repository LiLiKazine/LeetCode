//: [Previous](@previous)

/*
 
 410. Split Array Largest Sum
 
 Given an array which consists of non-negative integers and an integer m, you can split the array into m non-empty continuous subarrays. Write an algorithm to minimize the largest sum among these m subarrays.

 Note:
 If n is the length of array, assume the following constraints are satisfied:

 1 ≤ n ≤ 1000
 1 ≤ m ≤ min(50, n)
 Examples:

 Input:
 nums = [7,2,5,10,8]
 m = 2

 Output:
 18

 Explanation:
 There are four ways to split nums into two subarrays.
 The best way is to split it into [7,2,5] and [10,8],
 where the largest sum among the two subarrays is only 18.
 
 */

class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        var l = nums.max()!, r = nums.reduce(0, +)
        
        while l <= r {
            let mid = l + (r - l) / 2
            var s = 0, g = 0
            for n in nums {
                if s + n <= mid {
                    s += n
                } else {
                    g += 1
                    s = n
                }
            }
            if s > 0 { g += 1 }
            if g <= m {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return l
    }
}

let solution = Solution()
let ans = solution.splitArray([1,4,4], 3)
ans

//: [Next](@next)
