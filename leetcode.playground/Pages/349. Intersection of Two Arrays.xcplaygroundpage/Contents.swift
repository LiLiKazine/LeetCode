//: [Previous](@previous)

/*
 
 349. Intersection of Two Arrays
 
 Given two arrays, write a function to compute their intersection.

 Example 1:

 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2]
 Example 2:

 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [9,4]
 Note:

 Each element in the result must be unique.
 The result can be in any order.
 
 */

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var cache = [Int: Int](), ans = [Int]()
        for num in nums1 {
            cache[num] = 1
        }
        for num in nums2 {
            if cache[num] != nil {
                cache[num] = nil
                ans.append(num)
            }
        }
        return ans
    }
}

let nums1 = [1,2,2,1],
nums2 = [2,2]

let solution = Solution()
let ans = solution.intersection(nums1, nums2)
ans

//: [Next](@next)
