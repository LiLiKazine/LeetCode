//: [Previous](@previous)

/*
 
 321. Create Maximum Number
 
 Given two arrays of length m and n with digits 0-9 representing two numbers. Create the maximum number of length k <= m + n from digits of the two. The relative order of the digits from the same array must be preserved. Return an array of the k digits.

 Note: You should try to optimize your time and space complexity.

 Example 1:

 Input:
 nums1 = [3, 4, 6, 5]
 nums2 = [9, 1, 2, 5, 8, 3]
 k = 5
 Output:
 [9, 8, 6, 5, 3]
 Example 2:

 Input:
 nums1 = [6, 7]
 nums2 = [6, 0, 4]
 k = 5
 Output:
 [6, 7, 6, 0, 4]
 Example 3:

 Input:
 nums1 = [3, 9]
 nums2 = [8, 9]
 k = 3
 Output:
 [9, 8, 9]

 
 */

/*
 
 public int[] maxSubsequence(int[] nums, int k) {
       int length = nums.length;
       int[] stack = new int[k];
       int top = -1;
       int remain = length - k;
       for (int i = 0; i < length; i++) {
           int num = nums[i];
           while (top >= 0 && stack[top] < num && remain > 0) {
               top--;
               remain--;
           }
           if (top < k - 1) {
               stack[++top] = num;
           } else {
               remain--;
           }
       }
       return stack;
   }
 
 public int[] merge(int[] subsequence1, int[] subsequence2) {
     int x = subsequence1.length, y = subsequence2.length;
     if (x == 0) {
         return subsequence2;
     }
     if (y == 0) {
         return subsequence1;
     }
     int mergeLength = x + y;
     int[] merged = new int[mergeLength];
     int index1 = 0, index2 = 0;
     for (int i = 0; i < mergeLength; i++) {
         if (compare(subsequence1, index1, subsequence2, index2) > 0) {
             merged[i] = subsequence1[index1++];
         } else {
             merged[i] = subsequence2[index2++];
         }
     }
     return merged;
 }

作者：LeetCode-Solution
链接：https://leetcode-cn.com/problems/create-maximum-number/solution/pin-jie-zui-da-shu-by-leetcode-solution/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */


import Foundation

class Solution {
    
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        var arr: [Int] = []
        
        for i in 0...k {
            let arr1 = findMax(nums1, i)
            let arr2 = findMax(nums2, k-i)
            let temp = merge(arr1, arr2)
            if larger(temp, arr) {
                arr = temp
            }
        }
        return arr
    }
    
    func findMax(_ nums: [Int], _ k: Int) -> [Int] {
        guard nums.count >= k else {
            return []
        }
        var residue = k, lastIdx = 0, arr: [Int] = []
        while residue > 0 {
            let idx = findMax(nums, lastIdx, h: nums.count-residue)
            arr.append(nums[idx])
            lastIdx = idx + 1
            residue -= 1
        }
        return arr
    }
    
    func findMax(_ nums: [Int], _ l: Int, h: Int) -> Int {
        var max = -1, idx = 0
        for i in l...h {
            if nums[i] > max {
                max = nums[i]
                idx = i
            }
        }
        return idx
    }
    
    func merge(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let length1 = nums1.count, length2 = nums2.count
        if length1 == 0 {
            return nums2
        }
        if length2 == 0 {
            return nums1
        }
        var ans = [Int]()

        var i1 = 0, i2 = 0
        while i1 < length1 && i2 < length2 {
            if nums1[i1] == nums2[i2] {
                if larger(Array(nums1[i1..<nums1.endIndex]), Array(nums2[i2..<nums2.endIndex])) {
                    ans.append(nums1[i1])
                    i1 += 1
                } else {
                    ans.append(nums2[i2])
                    i2 += 2
                }
            } else if nums1[i1] > nums2[i2] {
                ans.append(nums1[i1])
                i1 += 1
            } else {
                ans.append(nums2[i2])
                i2 += 2
            }
        }
        if i1 < length1 {
            ans.append(contentsOf: nums1[i1..<nums1.endIndex])
        }
        if i2 < length2 {
            ans.append(contentsOf: nums2[i1..<nums2.endIndex])
        }
        return ans
    }
    
    func larger(_ n1: [Int], _ n2: [Int]) -> Bool {
        let c1 = n1.count, c2 = n2.count
        if c1 == c2 {
            for i in 0 ..< c1 {
                if n1[i] == n2[i] {
                    continue
                } else {
                    return n1[i] > n2[i]
                }
            }
            return false
        } else {
            return c1 > c2
        }
    }
}

let solution = Solution()

let ans = solution.maxNumber([3,3,3,2,3,7,3,8,6,0,5,0,7,8,9,2,9,6,6,9,9,7,9,7,6,1,7,2,7,5,5,1],
                             [5,6,4,9,6,9,2,2,7,5,4,3,0,0,1,7,1,8,1,5,2,5,7,0,4,3,8,7,3,8,5,3,8,3,4,0,2,3,8,2,7,1,2,3,8,7,6,7,1,1,3,9,0,5,2,8,2,8,7,5,0,8,0,7,2,8,5,6,5,9,5,1,5,2,6,2,4,9,9,7,6,5,7,9,2,8,8,3,5,9,5,1,8,8,4,6,6,3,8,4,6,6,1,3,4,1,6,7,0,8,0,3,3,1,8,2,2,4,5,7,3,7,7,4,3,7,3,0,7,3,0,9,7,6,0,3,0,3,1,5,1,4,5,2,7,6,2,4,2,9,5,5,9,8,4,2,3,6,1,9],
160)

//: [Next](@next)

//[9,9,9,9,9,9,9,7,8,7,6,1,7,2,7,5,5,1,5,2,5,7,1,0,4,3,8,7,3,8,5,3,8,3,4,0,2,3,8,2,7,1,2,3,8,7,6,7,1,1,3,9,0,5,2,8,2,8,7,5,0,8,0,7,2,8,5,6,5,9,5,1,5,2,6,2,4,9,9,7,6,5,7,9,2,8,8,3,5,9,5,1,8,8,4,6,6,3,8,4,6,6,1,3,4,1,6,7,0,8,0,3,3,1,8,2,2,4,5,7,3,7,7,4,3,7,3,0,7,3,0,9,7,6,0,3,0,3,1,5,1,4,5,2,7,6,2,4,2,9,5,5,9,8,4,2,3,6,1,9]
