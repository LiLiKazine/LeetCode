//: [Previous](@previous)

/*
 
 1424. Diagonal Traverse II
 
 Given a list of lists of integers, nums, return all elements of nums in diagonal order as shown in the below images.
  

 Example 1:



 Input: nums = [[1,2,3],
                [4,5,6],
                [7,8,9]]
 Output: [1,4,2,7,5,3,8,6,9]
 Example 2:



 Input: nums = [[1,2,3,4,5],
                [6,7],
                [8],
                [9,10,11],
                [12,13,14,15,16]]
 Output: [1,6,2,8,7,3,9,4,12,10,5,13,11,14,15,16]
 Example 3:

 Input: nums = [[1,2,3],[4],[5,6,7],[8],[9,10,11]]
 Output: [1,4,2,5,3,8,6,9,7,10,11]
 Example 4:

 Input: nums = [[1,2,3,4,5,6]]
 Output: [1,2,3,4,5,6]
  

 Constraints:

 1 <= nums.length <= 10^5
 1 <= nums[i].length <= 10^5
 1 <= nums[i][j] <= 10^9
 There at most 10^5 elements in nums.
 
 */

class Solution {
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var ans = [Int](), rows = nums.count, lines = 0
        for i in 0..<rows {
            var a = i, b = 0
            lines = max(lines, nums[a].count)
            while a >= 0 {
                if b < nums[a].count {
                    ans.append(nums[a][b])
                }
                a -= 1
                b += 1
            }
        }
        for i in 0..<lines {
            if i == 0 {
                continue
            }
            var b = i, a = rows - 1
            while b < lines {
                if a < 0 {
                    break
                }
                if b < nums[a].count {
                    ans.append(nums[a][b])
                }
                a -= 1
                b += 1
            }
        }
        return ans
    }
}

let nums = [[1,2,3,4,5],
            [6,7],
            [8],
            [9,10,11],
            [12,13,14,15,16]]
let solution = Solution()
let ans = solution.findDiagonalOrder(nums)
ans

//: [Next](@next)
