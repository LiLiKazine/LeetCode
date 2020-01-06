//: [Previous](@previous)

/*
 4. Median of Two Sorted Arrays
 
 There are two sorted arrays nums1 and nums2 of size m and n respectively.

 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

 You may assume nums1 and nums2 cannot be both empty.

 Example 1:

 nums1 = [1, 3]
 nums2 = [2]

 The median is 2.0
 
 Example 2:

 nums1 = [1, 2]
 nums2 = [3, 4]

 The median is (2 + 3)/2 = 2.5
 */

import Foundation

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let c1 = nums1.count
        let c2 = nums2.count
        guard c1 + c2 > 0 else { return 0 }
        var newArr = [Int]()
        let m1 = (c1 + c2 - 1) / 2
        let m2 = (c1 + c2) / 2
        if c1 == 0 {
            return Double(nums2[m1] + nums2[m2]) / 2.0
        }
        if c2 == 0 {
            return Double(nums1[m1] + nums1[m2]) / 2.0
        }
        var i1 = 0 {
            didSet {
                newArr.append(nums1[oldValue])
            }
        }
        var i2 = 0 {
            didSet {
                newArr.append(nums2[oldValue])
            }
        }
        while i1 + i2 < c1 + c2 {
            if i1 < nums1.count && i2 < nums2.count {
                if nums1[i1] < nums2[i2] {
                    i1 += 1
                } else {
                    i2 += 1
                }
            } else if i1 < nums1.count {
                i1 += 1
            } else {
                i2 += 1
            }
            
        }
        let a = newArr[m1]
        let b = newArr[m2]
        return Double(a + b) / 2.0
    }
}

let test = Solution()
let result = test.findMedianSortedArrays([1, 2], [3, 4])

//: [Next](@next)
