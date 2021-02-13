//: [Previous](@previous)

/*
 
 448. Find All Numbers Disappeared in an Array
 
 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements of [1, n] inclusive that do not appear in this array.

 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

 Example:

 Input:
 [4,3,2,7,8,2,3,1]

 Output:
 [5,6]
 
 */

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums, n = nums.count, ans: [Int] = []
        for i in 0..<n {
            let num = nums[i] % (n + 1)
            nums[num - 1] += (n + 1)
        }
        for i in 0..<nums.count {
            let num = nums[i]
            if num <= n {
                ans.append(i + 1)
            }
        }
        return ans
    }
}

let solution = Solution()
let ans = solution.findDisappearedNumbers( [4,3,2,7,8,2,3,1])
ans

//: [Next](@next)
