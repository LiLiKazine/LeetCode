//: [Previous](@previous)

/*
 
 350. Intersection of Two Arrays II
 
 Given two arrays, write a function to compute their intersection.

 Example 1:

 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2,2]
 Example 2:

 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [4,9]
 Note:

 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 Follow up:

 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 
 */

class Solution {
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var cache: [Int: Int] = [:]
        var ans: [Int] = []
        for i in 0..<nums1.count {
            cache[nums1[i]] = (cache[nums1[i]] ?? 0) + 1
        }
        for i in 0..<nums2.count {
            if cache[nums2[i]] != nil && cache[nums2[i]]! > 0 {
                ans.append(nums2[i])
                cache[nums2[i]]! -= 1
            }
        }
        return ans
    }
    
    /*
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var maxLength: Int = 0
        var startIndex: Int = 0
        let short = nums1.count > nums2.count ? nums2 : nums1
        let long = nums1.count <= nums2.count ? nums2 : nums1
        for i in 0..<nums1.count {
            for j in 0..<nums2.count {
                let length = align(i, j, short, long)
                if maxLength < length {
                    maxLength = length
                    startIndex = i
                }
            }
            
        }
        if maxLength > 0 {
            return Array(short[startIndex..<startIndex+maxLength])
        }
        return []
    }
    
    func align(_ i1: Int, _ i2: Int, _ short: [Int], _ long: [Int]) -> Int {
        var i = 0;
        while i1 + i < short.count && i2 + i < long.count {
            if short[i1+i] == long[i2+i] {
                i += 1;
            } else {
                break
            }
        }
        return i
    }
 */
}

//: [Next](@next)
