//: [Previous](@previous)

/*
 
 164. Maximum Gap
 
 Given an unsorted array, find the maximum difference between the successive elements in its sorted form.

 Return 0 if the array contains less than 2 elements.

 Example 1:

 Input: [3,6,9,1]
 Output: 3
 Explanation: The sorted form of the array is [1,3,6,9], either
              (3,6) or (6,9) has the maximum difference 3.
 Example 2:

 Input: [10]
 Output: 0
 Explanation: The array contains less than 2 elements, therefore return 0.
 Note:

 You may assume all elements in the array are non-negative integers and fit in the 32-bit signed integer range.
 Try to solve it in linear time/space.
 
 */

class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        let count = nums.count
        guard count >= 2 else {
            return 0
        }
        var minNum = nums[0], maxNum = nums[0]
        for n in nums {
            minNum = min(minNum, n)
            maxNum = max(maxNum, n)
        }
        let stride = max(1, (maxNum - minNum) / (count - 1))
        var buckets = Array(repeating: [-1, -1], count: (maxNum - minNum) / stride + 1)
        for n in nums {
            let i = (n - minNum) / stride
            if buckets[i][0] == -1 {
                buckets[i][0] = n
                buckets[i][1] = n
            } else {
                buckets[i][0] = min(buckets[i][0], n)
                buckets[i][1] = max(buckets[i][1], n)
            }
        }
        var gap = 0, prev = -1
        for i in 0..<buckets.count {
            if buckets[i][0] == -1 {
                continue
            }
            if prev != -1 {
                gap = max(gap, buckets[i][0] - buckets[prev][1])
            }
            prev = i
        }
        
        return gap
    }
}


let num = [100,3,2,1]
let solution = Solution()
let ans = solution.maximumGap(num)
ans

//: [Next](@next)
