//: [Previous](@previous)

/*
 
 477. Total Hamming Distance
 
 The Hamming distance between two integers is the number of positions at which the corresponding bits are different.

 Given an integer array nums, return the sum of Hamming distances between all the pairs of the integers in nums.

  

 Example 1:

 Input: nums = [4,14,2]
 Output: 6
 Explanation: In binary representation, the 4 is 0100, 14 is 1110, and 2 is 0010 (just
 showing the four bits relevant in this case).
 The answer will be:
 HammingDistance(4, 14) + HammingDistance(4, 2) + HammingDistance(14, 2) = 2 + 2 + 2 = 6.
 Example 2:

 Input: nums = [4,14,4]
 Output: 4
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109
 
 */

class Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        var map: [[Int]] = Array(repeating: [0, 0], count: Int.bitWidth)
        for n in nums {
            for i in 0..<Int.bitWidth {
                if n & (1 << i) > 0 {
                    map[i][1] += 1
                } else {
                    map[i][0] += 1
                }
            }
        }
        let ans: Int = map.reduce(0) { res, pair in
            return res + pair[0] * pair[1]
        }
        return ans
    }
}

let nums = [4,14,4]
let solution = Solution()
let ans = solution.totalHammingDistance(nums)
ans

//: [Next](@next)
