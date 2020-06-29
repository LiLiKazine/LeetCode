//: [Previous](@previous)

/*
 
 215. Kth Largest Element in an Array
 
 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Example 1:

 Input: [3,2,1,5,6,4] and k = 2
 Output: 5
 Example 2:

 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4
 Note:
 You may assume k is always valid, 1 ≤ k ≤ array's length.
 
 */

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return quick(nums, k)
    }
    
    func quick(_ nums: [Int], _ k: Int) -> Int {
        var left: [Int] = [], right: [Int] = [], nums = nums, k = k
        while true {
            let pivot = nums[0]
            for i in 1..<nums.count {
                if nums[i] < pivot {
                    right.append(nums[i])
                } else {
                    left.append(nums[i])
                }
            }
            print(left, right)
            if left.count == k-1 {
                return pivot
            }
            if left.count >= k {
                nums = left
            } else {
                nums = right
                k = k - left.count - 1
            }
            left.removeAll()
            right.removeAll()
        }
    }
}

let solution = Solution()
let ans = solution.findKthLargest([2, 1], 2)
ans
//: [Next](@next)
