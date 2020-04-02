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

import Foundation

class Solution {
    
    func maxNumber(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [Int] {
        var arr: [Int] = [], a1: [Int] = [], a2: [Int] = []
        
        for i in 0...k {
            let arr1 = findMax(nums1, i)
            let arr2 = findMax(nums2, k-i)
            let temp = merge(arr1, arr2)
            if arr1.count + arr2.count == k {
                print(temp)
            }
            if larger(temp, arr) {
                arr = temp
                a1 = arr1
                a2 = arr2
            }
        }
//        print(a1, a2)
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
            lastIdx = idx+1
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
        var nums1 = nums1, nums2 = nums2, res: [Int] = []
        while !nums1.isEmpty || !nums2.isEmpty {
            guard let v1 = nums1.first else {
                return res + nums2
            }
            guard let v2 = nums2.first else {
                return res + nums1
            }
            if v1 > v2 {
                res.append(nums1.removeFirst())
            } else if v2 > v1 {
                res.append(nums2.removeFirst())
            } else {
                var i = 0
                while i < nums1.count && i < nums2.count && nums1[i] == nums2[i] {
                    i += 1
                }
                if i == nums1.count {
                    res.append(contentsOf: nums2[0..<i])
                    nums2.removeSubrange(0..<i)
                    continue
                }
                if i == nums2.count {
                    res.append(contentsOf: nums1[0..<i])
                    nums1.removeSubrange(0..<i)
                    continue
                }
                if nums1[i] > nums2[i] {
                    res.append(contentsOf: nums1[0..<i])
                    nums1.removeSubrange(0..<i)
                } else {
                    res.append(contentsOf: nums2[0..<i])
                    nums2.removeSubrange(0..<i)
                }
            }
        }
        return res
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
