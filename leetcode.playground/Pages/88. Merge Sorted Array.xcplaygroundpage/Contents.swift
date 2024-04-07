//: [Previous](@previous)

/*
 
 88. Merge Sorted Array
 
 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.

 The number of elements initialized in nums1 and nums2 are m and n respectively. You may assume that nums1 has a size equal to m + n such that it has enough space to hold additional elements from nums2.

  

 Example 1:

 Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 Output: [1,2,2,3,5,6]
 Example 2:

 Input: nums1 = [1], m = 1, nums2 = [], n = 0
 Output: [1]
  

 Constraints:

 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[i] <= 109
 
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var m = m, n = n, i = m + n - 1
        while m > 0 && n > 0 {
            if nums1[m-1] > nums2[n-1] {
                m -= 1
                nums1[i] = nums1[m]
            } else {
                n -= 1
                nums1[i] = nums2[n]
            }
            i-=1
        }
        while n > 0 {
            n -= 1
            nums1[i] = nums2[n]
            i -= 1
        }
    }
}

var nums1 = [1,2,3,0,0,0]
let m = 3, nums2 = [2,5,6], n = 3
let solution = Solution()
solution.merge(&nums1, m, nums2, n)
nums1

//: [Next](@next)
