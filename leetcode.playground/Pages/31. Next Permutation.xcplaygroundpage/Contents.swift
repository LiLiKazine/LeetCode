//: [Previous](@previous)

/*
 31. Next Permutation
 
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).

 The replacement must be in-place and use only constant extra memory.

 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.

 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1

 */
//                4 0 3 2 1
import Foundation

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let size = nums.count
        var i = size - 1, j = i - 1
        var flag = true
        while j >= 0 {
            if nums[i] > nums[j] {
                var diff = nums[i] - nums[j]
                var s = i
                for k in i+1..<size {
                    if nums[k] - nums[j] > 0 && nums[k] - nums[j] < diff {
                        diff = nums[k] - nums[j]
                        s = k
                    }
                }
                nums[j] = nums[j] + nums[s]
                nums[s] = nums[j] - nums[s]
                nums[j] = nums[j] - nums[s]
                nums[j+1..<size].sort()
                flag = false
                break
            } else {
                i-=1
                j-=1
            }
        }
        if flag {
            nums.sort()
        }
    }
}

let test = Solution()
var arr = [1,2]
test.nextPermutation(&arr)
arr
// [4,2,0,3,0,2,2]
//: [Next](@next)
